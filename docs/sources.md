# 上游来源与核验边界

核验日期：**2026-08-31**。已实际读取以下 GitHub 原项目 README 或其官方文档，不按名称猜包。GitHub README 中指向的官方安装器不等于把安装器源码复制到本仓库。

命令可能变化；每次 setup-mac 执行写入前，agent 要重新检查所选项目上游、平台和版本。下面只列显式选择的工具，不展开 Homebrew 自动解析的整棵依赖树；实际新增依赖必须在计划中告知。

## 基础与依赖

| 项目 | GitHub 原项目 | 安装/配置依据 |
|---|---|---|
| Homebrew | [Homebrew/brew](https://github.com/Homebrew/brew) | [安装要求](https://docs.brew.sh/Installation)；现有 prefix 优先 |
| Homebrew 安装器 | [Homebrew/install](https://github.com/Homebrew/install) | README 指向官方 `install.sh`；先下载审查再执行 |
| Git | [git/git](https://github.com/git/git) | [Git macOS](https://git-scm.com/downloads/mac)，[Homebrew git](https://formulae.brew.sh/formula/git) |
| nvm | [nvm-sh/nvm](https://github.com/nvm-sh/nvm) | README 的 tagged installer、`PROFILE=/dev/null`、初始化与 LTS 安装 |
| Node.js / 随附 npm | [nodejs/node](https://github.com/nodejs/node) | 由选定管理器安装，遵守 Node 的受支持版本；不另装第二个全局 Node |
| uv | [astral-sh/uv](https://github.com/astral-sh/uv) | [安装](https://docs.astral.sh/uv/getting-started/installation/)、[Python 管理](https://docs.astral.sh/uv/guides/install-python/)、[Brew uv](https://formulae.brew.sh/formula/uv) |
| Python | [python/cpython](https://github.com/python/cpython) | 用已有环境或 uv 文档支持的发行版本；不替换系统解释器 |
| pipx | [pypa/pipx](https://github.com/pypa/pipx) | [官方安装](https://pipx.pypa.io/stable/installation/)、[Brew pipx](https://formulae.brew.sh/formula/pipx) |
| fd | [sharkdp/fd](https://github.com/sharkdp/fd) | README macOS Homebrew 安装 |
| fzf | [junegunn/fzf](https://github.com/junegunn/fzf) | README Homebrew 与 zsh integration |
| zoxide | [ajeetdsouza/zoxide](https://github.com/ajeetdsouza/zoxide) | README Homebrew 与 `zoxide init zsh` |
| FFmpeg / ffplay | [FFmpeg/FFmpeg](https://github.com/FFmpeg/FFmpeg) | [官方二进制分发](https://ffmpeg.org/download.html)、[Brew ffmpeg](https://formulae.brew.sh/formula/ffmpeg)；radio-active 默认播放器需要 ffplay |
| mpv | [mpv-player/mpv](https://github.com/mpv-player/mpv) | [官方安装](https://mpv.io/installation/)、[Brew mpv](https://formulae.brew.sh/formula/mpv)；可选播放器 |
| yt-dlp | [yt-dlp/yt-dlp](https://github.com/yt-dlp/yt-dlp) | README 与 [Brew 包](https://formulae.brew.sh/formula/yt-dlp)；仅在所选音源可用时安装 |

另读取了 Homebrew 官方 JSON 元数据验证 `git`、`uv`、`pipx`、`ffmpeg`、`mpv`、`yt-dlp`、`yazi` 的包名和主页。包管理器页面是分发依据，不能替代上游原项目身份。

Apple 的 Command Line Tools/Xcode 以 [Apple 官方安装文档](https://developer.apple.com/documentation/xcode/installing-the-command-line-tools/) 为依据，没有将某个 GitHub 镜像当作 Apple 完整产品安装器。zsh、rm、du、stat、launchctl 使用 macOS 自带工具，不要求额外装 GNU 替代品。

## 附件中的 AI CLI

| CLI | 原项目/官方入口 | 核验结论 |
|---|---|---|
| Claude | [anthropics/claude-code](https://github.com/anthropics/claude-code) | 官方 installer 与 `claude-code` cask；npm 标记 deprecated；[setup](https://code.claude.com/docs/en/setup) |
| Codex | [openai/codex](https://github.com/openai/codex) | README 明确 Homebrew cask / npm 两种渠道；不是要求同时安装 |
| Kimi Code | [MoonshotAI/kimi-code](https://github.com/MoonshotAI/kimi-code) | [安装、认证、升级](https://moonshotai.github.io/kimi-code/en/guides/getting-started) |
| 旧 Kimi CLI | [MoonshotAI/kimi-cli](https://github.com/MoonshotAI/kimi-cli) | README 已提示向 Kimi Code 迁移；旧环境单独处理 |
| Grok | [xai-org/grok-build](https://github.com/xai-org/grok-build) | README 指向 x.ai 官方安装器；[update/登录命令](https://docs.x.ai/build/cli/reference) |
| Cursor Agent | [getcursor/cursor](https://github.com/getcursor/cursor) | 官方入口仓库不含 CLI 实现；[官方 CLI 文档](https://cursor.com/help/integrations/cli)明确 installer、`agent auth`、`agent update` |
| Gemini | [google-gemini/gemini-cli](https://github.com/google-gemini/gemini-cli) | README 明确 Brew/npm 安装；[配置](https://geminicli.com/docs/reference/configuration/) |
| traex | **未定位公开原项目** | 搜索 `traex CLI github traex update`、`"traex" "TraeCode"`、`"traex" "github.com" install` 未得到可确认的官方项目；第三方适配器不算来源。需要用户提供官方分发入口 |

traex 既有二进制的 `--help` 可证明它当前提供某个子命令，不能证明它来自哪个公开 GitHub 项目，也不能推出新机安装命令。仓库不自动安装/升级该未知来源项。

## 附件中的终端工具

| 工具 | GitHub 原项目 | 配置依据 |
|---|---|---|
| yazi | [sxyazi/yazi](https://github.com/sxyazi/yazi) | [安装](https://yazi-rs.github.io/docs/installation/)、[cwd wrapper](https://yazi-rs.github.io/docs/quick-start/)、[配置](https://yazi-rs.github.io/docs/configuration/overview/) |
| glow | [charmbracelet/glow](https://github.com/charmbracelet/glow) | README 的 Brew、CLI 与 config 说明 |
| radio-active | [dpnkrpl/radio-active](https://github.com/dpnkrpl/radio-active) | README 的 pipx、ffplay/FFmpeg、数据目录和命令表 |
| spotatui | [LargeModGames/spotatui](https://github.com/LargeModGames/spotatui) | README 与 [安装 Wiki](https://github.com/LargeModGames/spotatui/wiki/Installation)；特别注意 macOS 音源可用性 |
| surge | [sintaxi/surge](https://github.com/sintaxi/surge) | README 的 npm 包和发布命令；[官方文档](https://surge.sh/help/)中的高级域名配置需要按需再次核验 |
| ripgrep | [BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep) | README 安装；运行时 help 决定参数行为 |
| PicGo Core | [PicGo/PicGo-Core](https://github.com/PicGo/PicGo-Core) | README 的 npm 包与 [命令文档](https://docs.picgo.app/core/guide/commands)；不是桌面版 |

## 本仓库自己的实现与平台规范

- `utilities/rm-async/` 是本会话创建并修复的原创 zsh 实用函数，没有伪造第三方 GitHub 上游。首次 Git 初始化不代表已有远程 URL。
- `upgrade-cli-tools.sh` 在附件中是个人维护脚本，但附件没有提供实现。本仓库给 agent 编写本机维护脚本的行为约定，不虚构其 GitHub 项目、不复制未知脚本。
- launchd 行为：[Apple Scheduling Timed Jobs](https://developer.apple.com/library/archive/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/ScheduledJobs.html)、[Creating Launchd Jobs](https://developer.apple.com/library/archive/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/CreatingLaunchdJobs.html)。命令细节运行时读本机 `man launchctl`。
- agent 发现协议：[Codex skills](https://learn.chatgpt.com/docs/build-skills)、[Claude skills](https://code.claude.com/docs/en/skills)、[Gemini commands](https://github.com/google-gemini/gemini-cli/blob/main/docs/cli/custom-commands.md)、[Cursor skills](https://cursor.com/help/customization/skills)。

文档已核验不等于软件都已在目标 Mac 安装或使用成功；安装、认证、平台功能与定时任务必须分层验证。
