# Minis Skills

在 iPhone 上跑的一整套 agent 技能（Minis / iSH Alpine 环境），共 **77 个**：办公文档、金融数据、社媒平台、搜索、图像音视频、Apple 原生能力、开发运维。

包含**技能清单**（[SKILLS.md](SKILLS.md)）和**一键部署包**（`minis-skills-bundle.tar.gz` + `deploy.sh`）。

## 一键部署

```sh
git clone https://github.com/Willian8021743/minis-skills.git
cd minis-skills

sh deploy.sh --deps            # 全部 77 个 + 自动装依赖
sh deploy.sh --group office    # 只装一类
sh deploy.sh --only docx,pdf   # 挑着装
sh deploy.sh --check           # 体检：缺哪些包 / 命令 / 环境变量
sh deploy.sh --list            # 只列清单
sh deploy.sh --force           # 覆盖同名技能（覆盖前自动备份）
```

装到 `/var/minis/skills/`，新开一个会话后生效。`SKILLS_DEST=/path` 可改安装目录。

> `/var/minis` 是 noexec，必须 `sh deploy.sh`，不能 `./deploy.sh`。

## 分级

77 个技能按落地难度分四档，`--check` 会逐条告诉你缺什么：

| 档位 | 数量 | 说明 |
|---|---|---|
| 复制即用 | 18 | 纯指令文件，复制进目录就生效 |
| 需装依赖 | 19 | 带脚本，`--deps` 自动 `apk`/`pip` 装齐 |
| 需配凭据 | 29 | 装完要填 API Key / 登录 cookie |
| 部分受限 | 11 | 依赖 LibreOffice(`soffice`)/pandoc，iOS 上装不了，读写可用、渲染降级 |

## 分类

| 分类 | 数量 |
|---|---|
| 办公与文档 | 20 |
| 社媒与内容平台 | 16 |
| 开发与系统 | 12 |
| 数据与金融 | 8 |
| 图像·音频·可视化 | 8 |
| Apple 与 iOS | 8 |
| 搜索与网页 | 5 |

逐条说明（来源 / 环境 / 用法）见 **[SKILLS.md](SKILLS.md)**，机器可读清单见 `catalog.csv` / `catalog.json`。

## 目录

```
.
├── SKILLS.md                  # 77 条技能清单：名称 / 说明 / 来源 / 环境 / 用法
├── deploy.sh                  # 一键部署（busybox sh 可跑）
├── minis-skills-bundle.tar.gz # 技能本体，2.1 MB（已剔除 .venv / __pycache__）
├── catalog.csv / .json / .tsv # 清单数据
├── guide.html                 # 可视化版清单（离线打开，可筛选搜索）
└── MANIFEST.sha256            # 校验和
```

`minis-skills-bundle.tar.gz` 与 `MANIFEST.sha256` 配套校验：

```sh
sha256sum -c MANIFEST.sha256
```

## 说明

- 各技能版权归其原仓库作者所有，来源见 SKILLS.md「来源」列；标「自建」的为本机定制、无公开仓库。
- 部署包里只含技能定义与脚本，**不含任何 API Key、Cookie 或账号信息**；凭据类技能需要自己配置环境变量。
