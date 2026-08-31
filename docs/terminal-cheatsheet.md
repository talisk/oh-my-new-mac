# 终端工具：安装、配置与速查

维护版；[历史完整速查表](imported/terminal-cheatsheet.md)原样保留。安装依据来自原项目，核验日期 2026-08-31。按用户选择逐项执行，不把整篇视为自动安装列表。

## yazi：文件管理器

原项目：[sxyazi/yazi](https://github.com/sxyazi/yazi)；[安装](https://yazi-rs.github.io/docs/installation/)、[快速上手](https://yazi-rs.github.io/docs/quick-start/)。先检查终端支持，最小安装 `brew install yazi`，验证 `yazi --version` 和真实 TUI 打开/退出。

按需要另选 fd、ripgrep、fzf、zoxide，安装与来源见 [开发环境](development.md#可选-shell-增强)。复杂预览依赖不作为默认项：当前上游完整 Homebrew 示例还包含额外媒体/图像包和强制 link 指令；**不要在已有机器照抄 `--overwrite`**，先盘点冲突与具体预览需求。

默认使用 `yazi` 即可。用户需要退出后改变 shell 目录时，按上游 quick-start 的 `--cwd-file` 方法加入 `y` wrapper，并先检查是否已有同名函数/alias；不要覆盖已有快捷入口。配置文件按 [官方配置说明](https://yazi-rs.github.io/docs/configuration/overview/) 与实际 XDG 路径确定；保留自定义 keymap。

| 操作 | 常见默认键（以当前版本帮助为准） |
|---|---|
| 移动/进入/返回 | `h j k l` |
| 打开/退出 | `Enter` 或 `o`；`q` |
| 选择/取消 | `Space`；`Esc` |
| 复制/剪切/粘贴 | `y` / `x` / `p` |
| 新建/重命名/隐藏文件 | `a` / `r` / `.` |
| 帮助 | `F1` 或 `~` |

删除键涉及废纸篓或永久删除，不能用用户文件验证；标签页按键等以运行中的帮助为准，不把历史表的 `t t` 固定写入新配置。升级仅对用户选择的 Brew 包运行 `brew upgrade yazi`。

## glow：Markdown 阅读器

原项目：[charmbracelet/glow](https://github.com/charmbracelet/glow)。安装 `brew install glow`，验证 `glow --version` 和 `glow README.md`。

```sh
glow README.md
glow -p README.md
glow -s dark README.md
glow -w 80 README.md
```

直接 `glow` 打开 TUI；不承诺历史 stash 服务仍可用。没有必需配置，用户选择主题时才运行 `glow config` 或按上游配置说明修改。Brew 安装用 `brew upgrade glow` 维护。

## radio-active：终端电台（命令名 radio）

原项目：[dpnkrpl/radio-active](https://github.com/dpnkrpl/radio-active)。上游推荐 `pipx install radio-active`；pipx 缺失时按 [开发环境](development.md#pipx仅在需要-python-cli-时) 配置，避免污染系统 Python。

默认播放器为 ffplay，上游要求 FFmpeg；可安装 `brew install ffmpeg` 并验证 `ffplay -version`。FFmpeg 原项目：[FFmpeg/FFmpeg](https://github.com/FFmpeg/FFmpeg)，[官方分发入口](https://ffmpeg.org/download.html)、[Brew 包](https://formulae.brew.sh/formula/ffmpeg)。若选择 mpv，才安装 `brew install mpv`；来源：[mpv-player/mpv](https://github.com/mpv-player/mpv)，[macOS 安装](https://mpv.io/installation/)。

```sh
radio --help
radio --search jazz
radio --last
radio --player mpv
```

`--search` 可能直接播放，不能把它当作纯只读检查。首次网络播放、录音或后台播放先由用户选择。默认配置 `~/radioactive/config.ini`、录音 `~/radioactive/recordings`，保留已有收藏和配置。升级 `pipx upgrade radio-active`，不以更新为由清空收藏。更多选项直接查看当前 `radio --help`，历史速查表只作参考。

## spotatui：音乐 TUI

原项目：[LargeModGames/spotatui](https://github.com/LargeModGames/spotatui)，[安装 Wiki](https://github.com/LargeModGames/spotatui/wiki/Installation)。macOS 的上游 Brew 方式：

```sh
brew tap LargeModGames/spotatui
brew install spotatui
```

先检查 tap 是否已有，验证 `spotatui --help`，再由用户选择是否启动认证/播放。Spotify 流媒体播放需要 Premium 和上游要求的认证设置；不要自动创建开发者应用或接受付费条款。

当前 README 同时介绍多音源，但注明一些非 Spotify 音源尚未在 macOS 构建启用。**不能承诺这台 Mac 可用 YouTube/本地文件/网络电台等全部音源**；以实际构建和首次来源选择器为准，功能不可用就记录，不盲目装依赖。

只有确认构建支持且用户选择 YouTube 时才装 `yt-dlp`，上游 [yt-dlp/yt-dlp](https://github.com/yt-dlp/yt-dlp) 与 [Brew 包](https://formulae.brew.sh/formula/yt-dlp)：`brew install yt-dlp`。它若由 Brew 管理，升级用 `brew upgrade yt-dlp`，不要照搬二进制发行版的 `yt-dlp -U`。

配置位于绝对 `XDG_CONFIG_HOME` 下的 `spotatui/config.yml`，否则 `~/.config/spotatui/config.yml`。帮助 `?`，来源/设备 `d`，加入队列 `z`，队列 `Shift+Q`。配置、快捷键和隐私/Discord 集成按实际版本展示，让用户决定，不能把默认联网集成当作已获授权。Brew 渠道更新 `brew upgrade spotatui`。

## surge：静态站点部署

原项目：[sintaxi/surge](https://github.com/sintaxi/surge)。确认当前 Node/npm 来源后安装 `npm install -g surge`，用 `surge --help` 验证。账号登录与发布分开处理，不能运行裸 `surge` 作为安装测试，因为它会进入发布流程。

```sh
surge login
surge list
```

这些命令仅在用户需要账号功能时运行。实际发布示例 `surge ./dist example.surge.sh`、下线 `surge teardown example.surge.sh` 都会修改远程状态，每次按用户明确请求处理。不要调用 `surge token` 并把令牌输出到报告。

历史附件中的 NS/CNAME、`encrypt`、`dns` 等高级命令没有在本次原项目 README 中建立完整适用条件，**不作为新机默认配置**。用户确需自定义域名时读取当前 [Surge 官方文档](https://surge.sh/help/) 和本机 help，确认域名、费用、DNS 与证书规则后另作计划。升级沿原 npm 来源运行 `npm install -g surge@latest`。

## ripgrep：代码搜索（命令名 rg）

原项目：[BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep)。`brew install ripgrep`；验证 `rg --version` 和在临时文件中的搜索。无需默认配置。

| 命令 | 用法 |
|---|---|
| `rg -n foo src/` | 搜索并显式显示行号 |
| `rg -S foo` | 智能大小写：模式含大写时区分大小写 |
| `rg -F 'a.b'` | 按纯文本搜索 |
| `rg -g '*.ts' foo` | 只搜匹配路径 |
| `rg --files` | 列出符合忽略规则的文件 |
| `rg --hidden --no-ignore foo` | 同时搜索隐藏和被忽略文件，注意秘密和性能 |
| `rg foo -r bar` | 替换显示结果，**不修改文件** |

默认会考虑忽略规则；输出到管道时行号等呈现不同，脚本中显式指定所需选项。`rg --json` 是结构化输出，不要求额外安装 delta。Brew 渠道升级 `brew upgrade ripgrep`。

## PicGo Core：命令行图床

原项目：[PicGo/PicGo-Core](https://github.com/PicGo/PicGo-Core)，[官方命令指南](https://docs.picgo.app/core/guide/commands)。这是 CLI，不是 PicGo Electron 桌面应用。安装 `npm install -g picgo`；验证 `picgo --help`。

```sh
picgo use uploader
picgo set uploader
```

先由用户选择图床，再通过官方交互配置凭据，通常存储在 `~/.picgo/config.json`（自定义 `-c` 时以实际为准）。不要打印完整配置或把它复制进 Git。插件另行核验其原 GitHub 项目和权限，不默认安装附件里提到的所有提供方插件。

上传示例 `picgo u ./shot.png` 会发送文件到远程；无参数可能读取剪贴板，二者均不能当作安装验证。HTTP server、Cloud sync 等不是新机默认组件，需要时检查实际版本 help、鉴权与监听范围。升级沿原 npm 渠道 `npm install -g picgo@latest`。
