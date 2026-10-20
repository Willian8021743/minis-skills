# 本机技能清单（77 个）

| 名称 | 说明 | 来源 / 开源 | 环境 | 使用方法 |
|---|---|---|---|---|
| `brand-docx` | 从模板抽取品牌 → 套用到 DOCX（10 种大牌风格） | ferdinandobons/brand-docs | brandkit, python-docx；需 soffice/pandoc（iOS 缺失，渲染降级） | 说「套我们公司模板」 |
| `brand-pptx` | 从模板抽取品牌 → 套用到 PPTX | ferdinandobons/brand-docs | brandkit, python-pptx；需 soffice/pandoc（iOS 缺失，渲染降级） | 说「套品牌做 PPT」 |
| `brand-xlsx` | 从模板抽取品牌 → 套用到 XLSX | ferdinandobons/brand-docs | brandkit, openpyxl；需 soffice/pandoc（iOS 缺失，渲染降级） | 说「套品牌做表」 |
| `data-cleaning-for-excel` | 脏数据清洗：空行、重复、格式混杂 → 规范表 | andreworia/claude-excel-skills | Python3 + 文件系统，无额外依赖 | 说「清洗这堆脏数据」 |
| `deck-refresh` | 季度报/财报数字刷新到现有 deck | fivetaku/claude-office-skills | python-pptx | 说「更新这版 deck 的数字」 |
| `document-polisher` | DOCX 排版升级：Economist/McKinsey/Apple 等品牌美学 | MinisSkills 合集 | python-docx；需 soffice/pandoc（iOS 缺失，渲染降级） | 说「把文档排版做高级」 |
| `docx` | Word 文档读写/编辑/批注/修订，官方 OOXML 库 | anthropics/skills | python-docx, lxml, pandoc；需 soffice/pandoc（iOS 缺失，渲染降级） | 说「写/改这份 Word」 |
| `excel-hygiene` | xlsx 机械体检：文本型数字、硬编码、截断 SUM | BayramAnnakov/excel-hygiene | openpyxl；需 soffice/pandoc（iOS 缺失，渲染降级） | 说「这表体检一下」 |
| `formula-audit-checker` | 公式审计清单：循环引用、隐式错误、单位不一致 | andreworia/claude-excel-skills | Python3 + 文件系统，无额外依赖 | 说「审一下公式」 |
| `ib-check-deck` | 投行级路演质检：数字一致性、叙事对齐、措辞 | fivetaku/claude-office-skills | python-pptx；需 soffice/pandoc（iOS 缺失，渲染降级） | 说「检查这份路演」 |
| `inputs-calcs-outputs-design` | 三表分离原则：Inputs / Calcs / Outputs | andreworia/claude-excel-skills | Python3 + 文件系统，无额外依赖 | 说「设计三表分离」 |
| `mermaid-to-vsdx` | Mermaid 流程图直接生成 Visio .vsdx | simoneven/mermaid-to-vsdx-skill | vsdx | 说「流程图转 Visio」 |
| `model-architecture-template` | 财务模型骨架：主表结构、命名、颜色、打印区 | andreworia/claude-excel-skills | Python3 + 文件系统，无额外依赖 | 说「搭财务模型」 |
| `office-hub` | 本地 Office 四件套（docx/xlsx/pptx/vsdx）统一入口 | MinisSkills 合集 | python-docx, openpyxl, python-pptx, vsdx | 说「做个 docx/xlsx/pptx」 |
| `pdf` | PDF 读取/合并拆分/表单填写/渲染成图 | anthropics/skills | pypdf, pdfplumber, pdf2image, pillow；需 soffice/pandoc（iOS 缺失，渲染降级） | 说「读这个 PDF / 拆页」 |
| `pdf-converter` | Markdown/HTML/图片转 PDF（typst + pandoc 管线） | MinisSkills 合集 | typst, pandoc；需 soffice/pandoc（iOS 缺失，渲染降级） | 说「转成 PDF」 |
| `pivot-table-builder` | 按扁平数据搭建透视表（行列值+筛选） | andreworia/claude-excel-skills | Python3 + 文件系统，无额外依赖 | 说「建个透视表」 |
| `pptx` | PowerPoint 生成/编辑、版式与母版（官方脚本集） | anthropics/skills | python-pptx, lxml；需 soffice/pandoc（iOS 缺失，渲染降级） | 说「做份 PPT」 |
| `scenario-manager` | Base/Bull/Bear 情景切换层（CHOOSE/INDEX） | andreworia/claude-excel-skills | Python3 + 文件系统，无额外依赖 | 说「加牛熊情景」 |
| `xlsx` | Excel 读写、公式、格式、图表（官方脚本集） | anthropics/skills | openpyxl, lxml；需 soffice/pandoc（iOS 缺失，渲染降级） | 说「做个表格/改 Excel」 |
| `deepseek-usage` | DeepSeek 余额/月消费/分模型 token/缓存命中率 | MinisSkills 合集 | browser_use 登录；凭据：DEEPSEEK_EMAIL, DEEPSEEK_PASSWORD | 说「查 DeepSeek 用量」 |
| `fucai3d-latest` | 福彩 3D 最新开奖号码与历史记录 | MinisSkills 合集 | Python3 + 文件系统，无额外依赖 | 说「福彩 3D 开奖」 |
| `korea-stock` | 韩股 KOSPI/KOSDAQ 行情（Naver，免登录） | MinisSkills 合集 | Python3 + 文件系统，无额外依赖 | 说「韩股/KOSPI」 |
| `reverse-dcf` | 反向 DCF：用市价倒推市场隐含假设 | MinisSkills 合集 | Python3 + 文件系统，无额外依赖 | 说「反推 DCF」 |
| `stock-fund-flow` | 行业/概念板块资金流与主力净流入排行（东财） | MinisSkills 合集 | Python3 + 文件系统，无额外依赖 | 说「板块资金流」 |
| `stock-price` | A股/港股/ETF/指数实时行情（腾讯接口，免 key） | MinisSkills 合集 | Python3 + 文件系统，无额外依赖 | 说「看下 A 股/这只票」 |
| `us-stock` | 美股三大指数 + Mag7 + VIX + 0DTE Gamma | MinisSkills 合集 | Python3 + 文件系统，无额外依赖 | 说「看美股」 |
| `whenpeak` | 按睡眠预测个人高效时段，给出排期建议 | MinisSkills 合集 | matplotlib；凭据：WHENPEAK_API_KEY | 说「我几点效率最高」 |
| `bilibili-hub` | B站：视频/用户/弹幕/评论读写 | jackwener/bilibili-cli | bilibili-api-python, aiohttp；凭据：BILI cookies | 说「B 站搜/看这个 UP」 |
| `douyin-downloader` | 抖音分享链接解析、无水印视频下载 | MinisSkills 合集 | requests | 说「下这个抖音」 |
| `maimai-hub` | 脉脉：同事圈帖子、职言热榜、公司 webcid | MinisSkills 合集 | 凭据：MAIMAI cookies | 说「脉脉职言」 |
| `memos-api` | Memos API：memo CRUD、AIP-160 过滤、分页 | MinisSkills 合集 | curl；凭据：MEMOS_TOKEN | 说「调 Memos API」 |
| `notion-hub` | Notion：搜索、页面 CRUD、数据库查询、评论 | MinisSkills 合集 | notion-client；凭据：NOTION_API_KEY | 说「写到 Notion」 |
| `qbt-hub` | qBittorrent WebUI：种子/磁力、限速、标签 | MinisSkills 合集 | python3；凭据：QBT_URL, QBT_USER, QBT_PASS | 说「磁力加到 qB」 |
| `quark-hub` | 夸克网盘：登录、目录、转存、分享链接 | ihmily/QuarkPanTool | python3；凭据：QUARK cookies | 说「转存到夸克」 |
| `spotify-hub` | Spotify 播放控制与查询（spotipy） | MinisSkills 合集 | spotipy；凭据：SPOTIFY_* (client_id/secret/refresh_token) | 说「放歌/暂停」 |
| `tg-hub` | Telegram：会话/消息/频道（Telethon） | jackwener/tg-cli | telethon；凭据：TG_API_ID, TG_API_HASH, TG_SESSION | 说「看 TG 频道/发消息」 |
| `twitter-downloader` | X 推文正文/图片/GIF/视频下载（fxtwitter） | MinisSkills 合集 | curl, jq, ffmpeg | 说「下这条推的图」 |
| `twitter-x-hub` | X/Twitter：推文/用户/时间线抓取 | public-clis/twitter-cli | httpx/pip；凭据：X cookies | 说「抓这个 X 账号」 |
| `weibo-hub` | 微博：热搜/用户/博文/评论 | jackwener/weibo-cli | httpx；凭据：WEIBO cookies | 说「微博热搜」 |
| `xianyu-hub` | 闲鱼：商品搜索、详情、卖家信息 | MinisSkills 合集 | curl；凭据：XIANYU cookies | 说「闲鱼搜…」 |
| `xiaohongshu-hub` | 小红书：笔记/搜索/评论/互动 | jackwener/xiaohongshu-cli | httpx, pycryptodome；凭据：XHS cookies | 说「小红书搜…」 |
| `youtube-downloader` | YouTube 视频/音频下载与转码 | MinisSkills 合集 | yt-dlp, ffmpeg | 说「下这个 YouTube」 |
| `ytmusic-hub` | YouTube Music 资料库读写 | MinisSkills 合集 | ytmusicapi；凭据：YTMusic cookies | 说「我 YT Music 歌单」 |
| `appstoreprice-hub` | App Store 各区价格查询（含签名逆向调用） | MinisSkills 合集 | browser_use | 说「查各区价格」 |
| `exa-search` | Exa 神经搜索 + 网页转 Markdown + 过滤检索 | MinisSkills 合集 | python3；凭据：EXA_API_KEY | 说「用 Exa 查」 |
| `tavily-search` | Tavily 检索 API | MinisSkills 合集 | tavily-python；凭据：TAVILY_API_KEY | 说「Tavily 搜」 |
| `web-content-extractor` | 网页正文提取（去广告/导航） | MinisSkills 合集 | curl / browser_use | 说「抓这篇正文」 |
| `web-search` | 多引擎搜索：Perplexity/Metaso/Google/Bing/DDG… | MinisSkills 合集 | browser_use | 说「搜一下…」 |
| `answer-me-with-html` | 把答案渲染成一页可视化 HTML 解释页 | Willian8021743/answer-me-with-html | node | 说「做成可视化页」 |
| `codex-image` | 用 Codex 后端 gpt-image-2 生成图片 | MinisSkills 合集 | python3；凭据：Codex 登录态 | 说「用 GPT 画图」 |
| `doubao-tts` | 豆包/火山引擎 TTS 文字转语音 | MinisSkills 合集 | uv；凭据：VOLC_TTS_APPID, VOLC_TTS_TOKEN | 说「用豆包念这段」 |
| `free-tts` | edge-tts 免费朗读，无需注册 | MinisSkills 合集 | edge-tts | 说「念给我听」 |
| `generative-ui-minis` | 文本 → 单文件 HTML 生成器（卡片/表/时间线/图） | MinisSkills 合集 | Python3 + 文件系统，无额外依赖 | 说「生成个 HTML 看板」 |
| `hyperframes` | HyperFrames：HTML 视频合成、GSAP 时间线、字幕 | heygen-com/hyperframes | node, ffmpeg | 说「做段 HTML 视频」 |
| `hyperframes-cli` | HyperFrames CLI：init/lint/render/tts，Minis 内渲染 | heygen-com/hyperframes | node, ffmpeg | 说「渲染成 MP4」 |
| `nano-banana` | Google Gemini 图像生成/编辑 | MinisSkills 合集 | 凭据：GEMINI_API_KEY / GOOGLE_API_KEY | 说「生成/改这张图」 |
| `apple-reminders` | 提醒事项：读取、简报、新增、安全改动 | MinisSkills 合集 | apple-reminders CLI | 说「加个提醒」 |
| `asc-cli` | App Store Connect CLI：TestFlight/上架/评论 | rorkai/App-Store-Connect-CLI | asc 二进制；凭据：ASC_KEY_ID, ASC_ISSUER_ID, .p8 | 说「看 TestFlight 构建」 |
| `contact-vcard-extractor` | 名片/二维码/截图 → 通讯录 vCard | MinisSkills 合集 | pillow | 说「把这些名片存通讯录」 |
| `coredevice-toolkit` | 免电脑免越狱 CoreDevice RSD 工具链 | MinisSkills 合集 | pymobiledevice3, cryptography, node | 说「连本机设备」 |
| `ios-location` | iPhone 虚拟定位：模块生成 + 本地选点地图 | 自建（未公开） | Python3 + 文件系统，无额外依赖 | 说「改定位到…」 |
| `native-app-actions` | 用 URL scheme 直接拉起本机 App 并带参数 | 自建（未公开） | Python3 + 文件系统，无额外依赖 | 说「打开微信搜…」 |
| `shortcut-share-file` | 通过「极速分享」快捷指令发 iCloud 文件 | 自建（未公开） | 凭据：快捷指令已安装 | 说「把这个文件发出去」 |
| `shortcuts-builder` | 自然语言 → Apple 快捷指令（含 golden 样例库） | viticci/shortcuts-playground-plugin | python3；凭据：签名需 HubSign 授权 | 说「做个快捷指令」 |
| `clash-控制器` | Clash/mihomo 控制器：连接/流量/规则/切节点 | openminis/MinisSkills | python3；凭据：CLASH_API_URL, CLASH_SECRET | 说「切节点/看流量」 |
| `cloudflare-dns` | flarectl 管理 Cloudflare DNS 与 zone | wsvn53/flarectl | flarectl 二进制；凭据：CF_API_TOKEN | 说「改 CF 解析」 |
| `codex-on-ish` | 在 iSH 里跑 OpenAI Codex CLI（含 MITM 代理方案） | MinisSkills 合集 | node；凭据：OPENAI_API_KEY | 说「在 iSH 跑 Codex」 |
| `evidence-chain-builder` | 给论断打分：证据链核查与引用 | MinisSkills 合集 | Python3 + 文件系统，无额外依赖 | 说「这数据有依据吗」 |
| `github-sync-helper` | 把本地产物同步到 GitHub 仓库 | 自建（未公开） | git；凭据：GITHUB_TOKEN | 说「推到 GitHub」 |
| `health-sleep-analysis` | Apple Health 睡眠分期/血氧/心率分析 | 自建（未公开） | apple-healthkit | 说「分析我睡眠」 |
| `openstreetmap-marker` | 生成高德风格地标地图 HTML（行程规划） | MinisSkills 合集 | Python3 + 文件系统，无额外依赖 | 说「做个行程地标图」 |
| `production-agent-public` | 生产级 ReAct Agent 规范：重试/降级/可观测 | MinisSkills 合集 | Python3 + 文件系统，无额外依赖 | 说「写生产级代码」 |
| `self-improving-agent` | 失败/纠错的自省日志与闭环反馈 | MinisSkills 合集 | Python3 + 文件系统，无额外依赖 | 失败/纠错时自动记录 |
| `skill-creator` | 编写/迭代 skill 的官方方法论 | anthropics/skills | Python3 + 文件系统，无额外依赖 | 说「写个新技能」 |
| `todoocard` | TodooCard 电子纸卡片推送（今天吃点啥） | MinisSkills 合集 | pillow；凭据：蓝牙/卡片 | 说「今天吃点啥」 |
| `xuexitong` | 学习通：课表/作业/成绩/章节/资料下载 | Han-maker-wp/xuexitong-skill | python3；凭据：学习通账号 | 说「我还有啥没交」 |

说明：技能目录 `/var/minis/skills/<名称>/`，入口统一为 `SKILL.md`；新会话才加载。「自建」= 本机定制、无公开仓库；其余标注的是公开仓库名（github.com/ 前省略）。