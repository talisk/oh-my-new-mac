# AI CLI 安装与升级

这是核验后的维护版，历史附件完整保存在 [原文](imported/ai-cli-upgrade.md)。核验日期为 2026-08-31；运行配置时重新确认官方说明和本机安装来源。

## 安装渠道与配置

同一命令默认选择一个渠道。已有可用安装优先保留，表中的新装建议不授权迁移或升级旧环境。安装器的 `curl | bash` 是上游命令示例，实际配置按 [工作流](workflow.md) 先下载、审阅，再运行。

| CLI | 原项目/官方说明 | 新装方法（择一） | 配置与验证 |
|---|---|---|---|
| Claude Code (`claude`) | [anthropics/claude-code](https://github.com/anthropics/claude-code) | `brew install --cask claude-code`；或官方 `https://claude.ai/install.sh` 安装器 | `claude --version`，启动 `claude` 由用户完成登录；保留已有设置。npm 渠道已在 README 标为 deprecated，不作为新装默认 |
| Codex (`codex`) | [openai/codex](https://github.com/openai/codex) | `brew install --cask codex`；或 `npm install -g @openai/codex` | `codex --version`，运行 `codex` 进行官方登录。保留原有配置、模型提供方和授权 |
| Kimi Code (`kimi`) | [MoonshotAI/kimi-code](https://github.com/MoonshotAI/kimi-code)，[开始使用](https://moonshotai.github.io/kimi-code/en/guides/getting-started) | 官方 `https://code.kimi.com/kimi-code/install.sh`；不需要先装 Node | `kimi --version`，启动后 `/login`。默认数据目录 `~/.kimi-code/`，不要输出其中凭据 |
| Grok (`grok`) | [xai-org/grok-build](https://github.com/xai-org/grok-build)，[CLI reference](https://docs.x.ai/build/cli/reference) | 官方 `https://x.ai/cli/install.sh` | `grok --version`，`grok login` 或首次启动官方认证；保留原配置 |
| Cursor Agent (`agent`，历史命令 `cursor-agent`) | [getcursor/cursor](https://github.com/getcursor/cursor) 是官方入口仓库，**不是 CLI 实现源码**；[CLI 官方说明](https://cursor.com/help/integrations/cli) | `https://cursor.com/install` 官方安装器 | 当前文档使用 `agent auth`。先确认 `agent` 的真实路径，避免撞到其他同名程序；旧 `cursor-agent` 以本机 help 为准，不擅自改名或迁移 |
| Gemini (`gemini`) | [google-gemini/gemini-cli](https://github.com/google-gemini/gemini-cli) | `brew install gemini-cli`；或 `npm install -g @google/gemini-cli` | `gemini --version`，首次运行选择官方登录方式。保留 `~/.gemini/settings.json` 的已有设置 |
| TraeX (`traex`) | **公开 GitHub 原项目未定位** | 不提供猜测安装命令；等待用户给官方项目或分发入口 | 本次仅验证既有二进制 help 自称 TraeCode CLI，包含 `update`；这不能证明新机器的安装方法 |

旧 [MoonshotAI/kimi-cli](https://github.com/MoonshotAI/kimi-cli) README 已指向 Kimi Code，并提示安装会迁移配置/会话。发现旧 Python `kimi-cli` 时默认保留，迁移前单独说明影响和备份；不能把两个项目当作同一包升级。

Cursor 未发现公开 CLI 实现仓库，使用可追溯的官方分发文档；不能装 GitHub 上同名的非官方替代物。traex 的搜索结果主要是第三方集成项目，不作为原项目依据。无来源时跳过该项，继续其他组件。

## 只维护实际选定的渠道

先 `whence -a <命令>` / `command -v <命令>`，结合链接、Brew 清单与 `npm prefix -g` 判断来源。命令不存在/未选择时跳过，不借“升级”顺便安装。

| 已确认渠道 | 手动升级方式 |
|---|---|
| Claude Homebrew cask | `brew upgrade --cask claude-code`；旧 `claude-code@latest` 若仍存在，先核实实际 token 和官方迁移建议，不直接套新 token |
| Claude 原生安装 | 依当前 [设置说明](https://code.claude.com/docs/en/setup) 和 `claude --help` 判断原生更新机制，不交给另一个包管理器覆盖 |
| Codex Homebrew / npm | `brew upgrade --cask codex` **或** `npm install -g @openai/codex@latest` |
| Kimi Code 原生 | `kimi upgrade`；官方流程可能要求交互选择，不能假设适合 launchd |
| Kimi Code npm | `npm install -g @moonshot-ai/kimi-code@latest`，仅当确实由 npm 安装 |
| Grok 原生 | `grok update`，先核实该版本在无终端下的行为 |
| Cursor 官方安装器 | 当前文档 `agent update`；旧 `cursor-agent update` 仅在本机 help 和来源核实后使用 |
| Gemini Homebrew / npm | `brew upgrade gemini-cli` **或** `npm install -g @google/gemini-cli@latest` |
| traex | 来源未确认，默认不进入维护任务；用户提供可信分发依据后再读实际 `traex update --help` |

不自动升级两套 Codex，不用全局 `brew upgrade`，不自动清理缓存或删除旧渠道。版本被固定或工具正在运行时，尊重用户的维护策略。

## 定时升级由 agent 按本机生成

仓库不分发全量升级安装器。用户明确选择定时维护后，agent 按本机**已安装且允许升级**的项目生成用户级维护脚本及 launchd 配置。它们是该机器的交付物，默认路径可采用 `~/.local/bin/upgrade-cli-tools.sh` 与 `~/Library/LaunchAgents/local.oh-my-new-mac.upgrade-cli-tools.plist`；已有同类任务先检查，不能重复创建或覆盖。

生成脚本应满足：

1. 逐个组件运行，记录起止时间、渠道、版本、退出码；某个失败不挡其他项目，但最后任一失败应返回非零。不要用无条件成功掩盖失败。
2. 不在无人值守环境执行会要求登录、确认、sudo 或付费的命令。遇到交互更新器跳过并记录，不猜测 `--yes` 参数；也不把 stdin 关闭等同于非交互支持。
3. 使用已确认渠道的绝对二进制路径，或经审阅的最小 PATH。launchd 不自动加载交互式 `.zshrc`。nvm 场景明确选择 Node 版本/alias，并在每次运行解析它；不要复制旧机器的固定版本路径，也不要 source 整份用户 zshrc。
4. 日志写入仅当前用户可访问的位置，目录先创建，日志不包含令牌。默认可保留最近 2000 行，但必须用临时文件+原子替换处理；保持失败记录可见。
5. 防止手动执行与定时执行同时升级；使用原子锁并记录拥有者，识别过期锁，不盲删锁。超时只终止本次启动的子进程，不按命令名杀全机进程。
6. 修改正在执行的维护脚本时用新文件原子替换，不能截断原文件。变更前备份，变更后语法检查。
7. 不自动升级 Node 本身，不改变 release channel，不顺带卸载重复安装。

可以从 [plist 示例](../templates/upgrade-cli-tools.plist.example) 生成配置。所有 `__...__` 标记必须替换：Label、用户名无关的脚本绝对路径、日志绝对路径、用户选择的时间。plist 不展开 `~` 或 `$HOME`；必须用 XML 安全的编码/序列化器处理特殊字符。示例 **09:53 只是继承附件的例子，不是默认选择**。

## launchd 操作与验收

下面假定 agent 已生成并验证上面的默认 label 和文件；若本机名称不同，替换为实际值。

```sh
plutil -lint "$HOME/Library/LaunchAgents/local.oh-my-new-mac.upgrade-cli-tools.plist"
launchctl bootstrap "gui/$(id -u)" "$HOME/Library/LaunchAgents/local.oh-my-new-mac.upgrade-cli-tools.plist"
launchctl print "gui/$(id -u)/local.oh-my-new-mac.upgrade-cli-tools"
```

`bootstrap` 前检查 `print`，已加载则不要重复注册。修改计划需要先 `bootout` 精确 label 再重新加载；检查非零退出码，不隐藏其他错误。

```sh
launchctl bootout "gui/$(id -u)/local.oh-my-new-mac.upgrade-cli-tools"
```

这会停用该任务。手动触发真实升级（只在用户允许时）：`launchctl kickstart "gui/$(id -u)/local.oh-my-new-mac.upgrade-cli-tools"`。本机没有 GUI launchd domain 时，不猜 root/system 替代方案；给出当前会话限制。

先用不升级软件的测试任务验证日志和调度上下文，再在授权范围内验证真实更新命令；“plist 可解析”“已加载”与“定时实际升级成功”分别记录。

Apple 对 `StartCalendarInterval` 的说明是：睡眠错过的任务可在唤醒后运行，关机错过的任务不会以相同行为补跑；不要依赖精确的唤醒秒数，也不要为了升级改变电源设置。[Apple Scheduling Timed Jobs](https://developer.apple.com/library/archive/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/ScheduledJobs.html)
