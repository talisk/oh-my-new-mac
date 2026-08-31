# 🖥️ Terminal Apps Cheat Sheet

> yazi · glow · radio-active · spotatui · surge

---

## 📁 yazi — 终端文件管理器

启动：`yazi`（或配 `y` wrapper，退出时同步 shell 的 cwd：`q` 同步 / `Q` 不同步）

| 键 | 作用 |
|---|---|
| `h j k l` | 左/下/上/右（进入/离开目录） |
| `g g` / `G` | 跳到顶部 / 底部 |
| `z` / `Z` | 用 fzf / zoxide 跳目录 |
| `Space` | 选中/取消当前 |
| `v` / `V` | 可视选择 / 反向选择 |
| `Ctrl+a` / `Ctrl+r` | 全选 / 反选 |
| `Esc` | 取消选择 |
| `Enter` / `o` | 打开 |
| `Tab` | 查看文件信息 |
| `y` `x` `p` `P` | 复制 / 剪切 / 粘贴 / 覆盖粘贴 |
| `d` / `D` | 移到回收站 / 永久删除 |
| `a` | 新建文件（结尾加 `/` 建目录） |
| `r` | 重命名 |
| `.` | 显示/隐藏隐藏文件 |
| `;` / `:` | 执行 shell 命令（`:` 阻塞） |
| `c c` `c d` `c f` `c n` | 复制：路径 / 目录路径 / 文件名 / 无扩展名 |
| `f` | 过滤文件 |
| `/` `?` `n` `N` | 查找下一个/上一个 |
| `s` / `S` | fd 按名搜索 / ripgrep 按内容搜索 |
| `, m` `, s` `, e` `, a` | 按修改时间 / 大小 / 扩展名 / 字母排序（大写反向） |
| `t t` | 新建标签页；`1-9` 切换；`[` `]` 前后切；`Ctrl+c` 关闭 |
| `F1` / `~` | 帮助菜单 |
| `q` | 退出 |

---

## ✨ glow — Markdown 阅读器

| 命令 | 作用 |
|---|---|
| `glow README.md` | 渲染查看一个 md 文件 |
| `glow` | 打开 TUI，浏览本地/GitHub stash 的 md |
| `glow -p file.md` | 用 pager（less 风格）阅读 |
| `glow -s dark file.md` | 指定主题（dark / light / notty…） |
| `glow -w 80 file.md` | 限制宽度 80 列 |
| `glow -a` | 显示本地所有 md（含隐藏目录） |
| `glow config` | 打开配置编辑器 |
| `cat a.md | glow -` | 从 stdin 读 |

TUI 内：`/` 过滤 · `enter` 打开 · `q` 退出 · `esc` 返回

---

## 📻 radio-active — 终端电台（4 万+ 电台）

命令名是 **`radio`**（首次使用先 `radio --search <名字>` 搜并播一个，之后 `radio` 直接出收藏菜单）

| 命令 | 作用 |
|---|---|
| `radio --search jazz` | 搜索电台 |
| `radio --play <收藏名/流URL>` | 直接播放 |
| `radio --last` | 播上次听的 |
| `radio --random` | 随机播收藏里的 |
| `radio --country CN` / `--language` / `--tag` | 按国家/语言/流派发现 |
| `radio --list` / `--add` / `--remove` | 管理收藏列表 |
| `radio --history` | 最近播放 |
| `radio --record --filename jazz --duration 30` | 录音 30 分钟（需 ffmpeg） |
| `radio --record-at "18:30" --uuid <id> --filename x --duration 30` | 定时录音 |
| `radio --player mpv` / `--volume 60` | 换播放器 / 音量 |
| `radio --kill` | 杀掉后台播放 |
| `radio --sort votes --limit 50 --filter "country=cn&bitrate>64"` | 排序/过滤结果 |

播放中命令行（底部 `:`）：`p` 播放/暂停 · `r` 录音开关 · `f` 加收藏 · `s` 搜新台 · `n` 下一个 · `timer` 睡眠定时 · `v 50` 音量 · `sz` Shazam 识曲 · `t` 当前曲目 · `b` 后台运行 · `q` 退出（Tab 可补全命令）

配置：`~/radioactive/config.ini`；录音目录：`~/radioactive/recordings`

---

## 🎵 spotatui — 终端音乐播放器

启动：`spotatui`（首次可选 Spotify / YouTube / Subsonic / 网络电台 / 本地文件；Spotify 需要 Premium）

| 键 | 作用 |
|---|---|
| `?` | 应用内帮助（所有快捷键） |
| `d` | 切换音源 / 设备 |
| `z` | 把当前曲目加入队列 |
| `Shift+Q` | 打开播放队列 |
| `v` | 音频可视化 |
| `Alt+,` | 打开设置 |
| `w` | 添加曲目到 YouTube 本地歌单 |

CLI 玩法：

```sh
spotatui play --name "My Playlist" --playlist --random   # 随机播歌单
spotatui playback --toggle                               # 播放/暂停
spotatui list --liked --limit 50                         # 列喜欢的歌
spotatui history recap --period 30d --output recap.html  # 听歌年度报告
spotatui --completions zsh                               # 生成补全
```

配置：`~/.config/spotatui/config.yml`

---

## 🚀 surge — 静态站点秒部署

| 命令 | 作用 |
|---|---|
| `surge` | 在当前目录交互式发布（会问路径和域名） |
| `surge ./dist my-app.surge.sh` | 一条命令部署 |
| `surge list` | 查看我的所有项目 |
| `surge teardown my-app.surge.sh` | 下线站点 |
| `surge login` / `logout` / `whoami` / `token` | 账号管理 |
| `echo example.com > CNAME` | 项目记住域名，之后直接 `surge` |

**自定义域名**（两步）：

1. 在注册商把 NS 指向 `ns1~ns4.surge.world`（推荐）；或加 `CNAME` → `na-west1.surge.sh`
2. `surge ./dist example.com` 部署，`surge encrypt example.com` 申请免费 HTTPS

其他：`surge dns example.com add MX 10 mail.x.com` 管 DNS · `surge audit example.com` 检查解析

---

## 🔍 ripgrep — 极速代码搜索（`rg`）

| 命令 | 作用 |
|---|---|
| `rg foo` | 当前目录递归搜 "foo"（自动忽略 .gitignore、隐藏文件、二进制） |
| `rg -i foo` / `-S` | 忽略大小写 / 智能大小写（有小写字母才不敏感） |
| `rg -w foo` / `-F` | 整词匹配 / 纯字面量（关闭正则） |
| `rg foo src/` / `rg foo -g '*.ts'` | 限定目录 / 限定文件类型 |
| `rg -t js foo` / `-T js` | 只搜某类型 / 排除某类型（`rg --type-list` 查类型） |
| `rg -g '!node_modules' foo` | 排除路径 |
| `rg -n foo` | 显示行号（默认就有） |
| `rg -c foo` / `-l` | 每文件匹配数 / 只列文件名 |
| `rg -C 3 foo` / `-A 5` / `-B 5` | 上下文 3 行 / 后 5 行 / 前 5 行 |
| `rg --hidden --no-ignore foo` | 连隐藏文件和 .gitignore 里的也搜 |
| `rg -e 'a|b' -e c` | 多个模式 OR |
| `rg foo -r bar` | 替换预览（配合 `--passthru` 输出替换结果） |
| `rg -q foo && echo found` | 静默模式，用退出码判断 |
| `rg --files` / `--files -g '*.md'` | 列文件（可代替 find） |
| `rg -f patterns.txt` | 从文件读多个搜索模式 |
| `rg foo --json | delta` 等 | JSON 输出供脚本处理 |
| `rg --stats foo` | 统计匹配数、耗时 |
| `rg -uu foo` | 等价 `--hidden --no-ignore`；`-uuu` 连二进制也搜 |

常用组合：`rg -l foo | xargs vim` · `rg -i todo -t py` · `rg 'fn\s+\w+' -g '*.rs'`

---

## 🖼️ picgo — 命令行图床上传

配置文件默认 `~/.picgo/config.json`（插件装在旁边的 `node_modules`）

| 命令 | 作用 |
|---|---|
| `picgo u a.jpg b.png` | 上传图片（多个空格分隔），输出链接 |
| `picgo u` | 不传参数 = 上传剪贴板第一张图（截图神器） |
| `picgo use uploader` | 交互式选图床（smms / tcyun / upyun / aliyun / qiniu / imgur / github） |
| `picgo use uploader github Work` | 指定图床 + 配置名（多配置） |
| `picgo set uploader` | 交互式配置图床（token、仓库、bucket 等） |
| `picgo get uploader` / `transformer` / `plugins` | 查看当前配置（`--format json` 可脚本化） |
| `picgo uploader list` | 列出某图床所有配置（rename / copy / rm 管理） |
| `picgo install <name>` / `uninstall` / `update` | 插件管理（只写短名，自动加 `picgo-plugin-` 前缀） |
| `picgo server -p 36677` | 起本地 HTTP 服务，`POST /upload` 传 `{"list":[...]}` 即可上传（空 body = 剪贴板） |
| `picgo server --secret xxx` | 服务鉴权（`Authorization: Bearer xxx`） |
| `picgo config sync` | 配置与 PicGo Cloud 同步（需 `picgo login`） |
| `picgo i18n en` | 切换语言 |

全局选项：`-d` 调试 · `-s` 静默 · `-p <proxy>` 走代理 · `-c <path>` 换配置文件

典型工作流：`picgo use uploader` → `picgo set uploader` → `picgo u ./shot.png`

---

*Sources: [yazi quick-start](https://yazi-rs.github.io/docs/quick-start) · [glow](https://github.com/charmbracelet/glow) · [radio-active](https://github.com/dpnkrpl/radio-active) · [spotatui](https://github.com/LargeModGames/spotatui) · [surge docs](https://surge.sh/docs/platform/custom-domains) · [ripgrep](https://github.com/burntsushi/ripgrep) · [picgo commands](https://docs.picgo.app/core/guide/commands)*
