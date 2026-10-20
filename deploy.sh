#!/bin/sh
# Minis Skills 一键部署（busybox sh / Alpine 兼容）
# 用法见 --help
set -u

HERE=$(cd "$(dirname "$0")" && pwd)
BUNDLE="$HERE/minis-skills-bundle.tar.gz"
DEST="${SKILLS_DEST:-/var/minis/skills}"
TSV="$HERE/catalog.tsv"
FORCE=0; DEPS=0; LIST=0; CHECK=0; DRY=0
ONLY=""; GROUP=""

usage() {
  cat <<'EOF'
Minis Skills 一键部署

  sh deploy.sh [选项]

  --all             部署全部（默认行为）
  --only a,b,c      只部署指定技能（逗号分隔）
  --group office    按分类部署：office finance social search media apple dev
  --force           覆盖已存在的同名技能（先备份到 /var/minis/skills.bak-时间戳）
  --deps            顺带安装 apk / pip 依赖
  --list            只列清单，不写任何文件
  --check           体检：哪些依赖 / 环境变量缺失
  --dry-run         只打印将要做什么
  -h, --help        本帮助

  SKILLS_DEST=/path 自定义安装目录（默认 /var/minis/skills）
EOF
}

while [ $# -gt 0 ]; do
  case "$1" in
    --only)   ONLY="$2"; shift 2 ;;
    --only=*) ONLY="${1#*=}"; shift ;;
    --group)  GROUP="$2"; shift 2 ;;
    --group=*) GROUP="${1#*=}"; shift ;;
    --force)  FORCE=1; shift ;;
    --deps)   DEPS=1; shift ;;
    --list)   LIST=1; shift ;;
    --check)  CHECK=1; shift ;;
    --dry-run) DRY=1; shift ;;
    --all)    shift ;;
    -h|--help) usage; exit 0 ;;
    *) echo "未知参数：$1（--help 看用法）"; exit 1 ;;
  esac
done

[ -f "$TSV" ] || { echo "缺少 catalog.tsv，先跑 python3 build.py"; exit 1; }

# ---------- 选出目标技能 ----------
targets() {
  awk -F'\t' -v only="$ONLY" -v grp="$GROUP" '
    NR==1 {next}
    {
      name=$1; cat=$2
      ok=1
      if (grp!="" && cat!=grp) ok=0
      if (only!="" && index("," only ",", "," name ",")==0) ok=0
      if (ok) print name "\t" cat "\t" $3 "\t" $4 "\t" $5
    }' "$TSV"
}

n_sel=$(targets | wc -l | tr -d ' ')
[ "$n_sel" -gt 0 ] || { echo "没有匹配的技能（--group 可选：$(awk -F'\t' 'NR>1{print $2}' "$TSV" | sort -u | tr '\n' ' ')）"; exit 1; }

if [ "$LIST" = 1 ]; then
  echo "共 $n_sel 个技能将被部署 → $DEST"
  targets | awk -F'\t' '{printf "  %-28s %-8s %s\n", $1, $2, $3}'
  exit 0
fi

# ---------- 体检模式 ----------
if [ "$CHECK" = 1 ]; then
  echo "== 环境变量 / 凭据 =="
  targets | while IFS='	' read -r name cat tier deps key; do
    [ "$tier" = "config" ] || continue
    miss=""
    oldifs=$IFS; IFS=','
    for k in $key; do
      k=$(echo "$k" | sed 's/^ *//; s/ *$//')
      case "$k" in *[!A-Za-z0-9_]*|"") continue ;; esac
      eval "v=\${$k:-}"
      [ -n "$v" ] || miss="$miss $k"
    done
    IFS=$oldifs
    [ -n "$miss" ] && printf "  %-24s 缺:%s\n" "$name" "$miss"
  done
  echo "== 外部命令 =="
  for c in ffmpeg jq node npx uv pandoc soffice typst yt-dlp git curl rg tesseract; do
    if command -v "$c" >/dev/null 2>&1; then printf "  %-10s ✅\n" "$c"; else printf "  %-10s ❌\n" "$c"; fi
  done
  echo "== Python 包 =="
  python3 - <<'PY'
mods = ["PIL","openpyxl","docx","pptx","lxml","pypdf","pdfplumber","pdf2image","vsdx","requests",
        "httpx","Crypto","matplotlib","fitz","tavily","spotipy","telethon","bilibili_api",
        "cryptography","defusedxml","notion_client","ytmusicapi","edge_tts","pymobiledevice3"]
import importlib
for m in mods:
    try:
        importlib.import_module(m); print("  %-18s ✅" % m)
    except Exception:
        print("  %-18s ❌" % m)
PY
  echo "== 未安装技能（相对本包）=="
  targets | awk -F'\t' -v d="$DEST" '{ if (system("test -d \"" d "/" $1 "\"")) print "  " $1 }'
  exit 0
fi

# ---------- 解包 ----------
[ -f "$BUNDLE" ] || { echo "缺少 $BUNDLE"; exit 1; }
TMP="${TMPDIR:-/tmp}/skills-deploy.$$"
rm -rf "$TMP"; mkdir -p "$TMP"
if [ "$DRY" = 0 ]; then
  tar -xzf "$BUNDLE" -C "$TMP" || { echo "解包失败"; exit 1; }
fi

# ---------- 安装 ----------
mkdir -p "$DEST" 2>/dev/null
BAK=""
added=0; skipped=0
targets | while IFS='	' read -r name cat tier deps key; do
  src="$TMP/$name"
  if [ "$DRY" = 1 ]; then echo "  +  $name  [$tier]"; continue; fi
  [ -d "$src" ] || { echo "  ⚠  包里没有 $name"; continue; }
  if [ -d "$DEST/$name" ] && [ "$FORCE" = 0 ]; then
    skipped=$((skipped+1)); echo "  =  $name（已存在，跳过；--force 覆盖）"
    continue
  fi
  if [ -d "$DEST/$name" ]; then
    [ -n "$BAK" ] || { BAK="$DEST.bak-$(date +%Y%m%d-%H%M%S)"; mkdir -p "$BAK"; }
    cp -a "$DEST/$name" "$BAK/" 2>/dev/null
  fi
  rm -rf "$DEST/$name"
  cp -a "$src" "$DEST/$name"
  echo "  ✓  $name  [$tier]"
done
# 共享引擎
if [ -d "$TMP/.brand-docs" ] && [ "$DRY" = 0 ]; then
  if [ ! -d "$DEST/.brand-docs" ] || [ "$FORCE" = 1 ]; then
    cp -a "$TMP/.brand-docs" "$DEST/.brand-docs"; echo "  ✓  .brand-docs（品牌引擎共享库）"
  fi
fi

# ---------- 依赖 ----------
if [ "$DEPS" = 1 ] && [ "$DRY" = 0 ]; then
  echo "-- 安装系统依赖（已装的会跳过）--"
  need_apk=""
  for c in ffmpeg:ffmpeg jq:jq rg:ripgrep node:nodejs; do
    bin=${c%%:*}; pkg=${c#*:}
    command -v "$bin" >/dev/null 2>&1 || need_apk="$need_apk $pkg"
  done
  if [ -n "$need_apk" ]; then
    echo "   apk add$need_apk"
    apk add --no-cache $need_apk >/dev/null 2>&1 && echo "   ✅ apk 完成" || echo "   ⚠  apk 部分失败（可手动 apk add$need_apk）"
  else
    echo "   ✅ 系统依赖已齐"
  fi

  echo "-- 安装 Python 包（失败的会跳过，多数在 musl 无轮子）--"
  python3 - <<'PY'
import importlib, subprocess, sys
mods = [("PIL","pillow"),("openpyxl","openpyxl"),("docx","python-docx"),("pptx","python-pptx"),
        ("lxml","lxml"),("pypdf","pypdf"),("pdfplumber","pdfplumber"),("pdf2image","pdf2image"),
        ("vsdx","vsdx"),("httpx","httpx"),("Crypto","pycryptodome"),("matplotlib","matplotlib"),
        ("fitz","pymupdf"),("tavily","tavily-python"),("spotipy","spotipy"),("telethon","telethon"),
        ("bilibili_api","bilibili-api-python"),("cryptography","cryptography"),("defusedxml","defusedxml"),
        ("notion_client","notion-client"),("ytmusicapi","ytmusicapi"),("edge_tts","edge-tts"),
        ("pymobiledevice3","pymobiledevice3")]
for mod, pkg in mods:
    try:
        importlib.import_module(mod); continue
    except Exception:
        pass
    r = subprocess.run([sys.executable, "-m", "pip", "install", "-q", "--no-input", pkg],
                       stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    print(("   ✅ " if r.returncode == 0 else "   ⚠  ") + pkg + ("" if r.returncode == 0 else "（装不上，需手动或跳过）"))
PY
fi

[ "$DRY" = 0 ] && rm -rf "$TMP"

echo ""
echo "完成：$DEST"
[ -n "$BAK" ] && echo "旧版本备份：$BAK"
echo "提示：新开一个会话才会加载新技能；凭据类技能用 'sh deploy.sh --check' 看缺什么。"
