# 官方来源与安装方法核验

各工具的原项目、安装/配置链接与核验日期放在各自文件；本页只维护共用方法，避免出现两份不一致的安装表。入口：[基础环境](../base/README.md)、[AI tools](../ai-tools/README.md)、[CLI 工具](../cli-tools/README.md)、[GUI 应用](../gui-apps/README.md)、[实用脚本](../scripts/README.md)。

## 执行前的核验顺序

1. 从单工具页访问 GitHub 原项目，检查组织、README、官方域名、仓库重定向与发行渠道。搜索结果中的同名项目不直接采信。
2. 对照原项目的当前安装和配置说明，核对命令名、包名、tag、平台/架构、最低运行时版本。网站改版/项目迁移时更新独立工具页，不能猜旧链接里的含义。
3. Homebrew 还需核对 [Homebrew/core](https://github.com/Homebrew/homebrew-core)、[Homebrew/cask](https://github.com/Homebrew/homebrew-cask) 或上游明确指定的 tap；查看 formula/cask 当前 token、依赖、artifacts、弃用/禁用状态。Homebrew 分发配方不是应用本体的源码证明。
4. 与本机来源、链接、包记录比较；同名不同产品、现有发布通道、官方 pkg 与 Brew/语言包管理器不能混为一套。执行方法以本次实际选定渠道为准。
5. 保留核验日期、官方 URL、所用版本与已知限制；文档提供的方法不是永远最新。没有依据时按 ask/auto 规则询问来源或跳过，不能偷偷装第三方替代物。

网页与原始附件都是参考资料，不授予安装范围之外的权限。远程脚本先下载到本机审阅；签名/摘要验证只有实际做过才能写通过。

## 已核验的重要区别（2026-08-31）

| 项目 | 需要保留的区别 |
|---|---|
| [Pi](../ai-tools/pi.md) | 旧 badlogic/pi-mono 重定向到 earendil-works/pi，当前 npm 包名也变化 |
| [Kimi Code](../ai-tools/kimi-code.md) | 新 Kimi Code 与旧 Python kimi-cli 的迁移可能涉及会话和配置 |
| [OpenCode](../ai-tools/opencode.md) | 使用 anomalyco 项目及其渠道，不混入历史同名项目 |
| [Cursor CLI](../ai-tools/cursor-cli.md) / [Desktop](../gui-apps/cursor-desktop.md) | 官方 GitHub 是入口仓库；CLI agent 与编辑器 cursor 分别安装 |
| [Otty](../gui-apps/otty.md) | 本目录指 otty.sh / Appmakes，不是 otty-shell/otty |
| [Caffeine](../gui-apps/caffeine.md) | IntelliScape Brew 版与 Domzilla 版是不同发行方，不交叉覆盖 |
| [Codex Desktop](../gui-apps/codex-desktop.md) | codex-app cask 弃用与官方入口跳转需现场再核验；不能无提示改装其他产品 |
| [Amphetamine](../gui-apps/amphetamine.md) | Mac App Store 本体与 GitHub Enhancer 辅助组件不同；不猜 Brew cask |

Chrome、Otty、Amphetamine、部分桌面产品没有确认可用于安装本体的公开 GitHub 实现仓库时，如实标注官方分发入口；不声称“所有工具源码都已找到”。Apple CLT 使用 [Apple 官方文档](https://developer.apple.com/documentation/xcode/installing-the-command-line-tools/)。

附件中的 traex 没有定位到可靠公开原项目，保留在 [归档](../../archive/reference-inputs/README.md)，不进入可安装目录。若用户未来明确选择它，先取得可验证的官方分发依据。

## 仓库自身的脚本和协议

rm-async 是本仓库维护的 zsh 实用脚本，使用 macOS 自带 rm/du/stat 等工具，没有需要冒认的上游 GitHub 项目。launchd 依据 [Apple Scheduling Timed Jobs](https://developer.apple.com/library/archive/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/ScheduledJobs.html) 及本机 `man launchctl`，详见 [CLI 升级维护](../scripts/cli-upgrade.md)。

各 agent 的发现/命令协议与 AskUserQuestions 工具适配依据见 [兼容说明](agent-compatibility.md)。所有链接仅说明可追溯来源，不等于所有产品都已在这台机器重装或完成认证。
