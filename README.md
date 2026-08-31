# oh-my-new-mac

给 agent 阅读的 macOS 配置清单、官方安装依据和交互流程。适用于新 Mac，也适用于已有开发环境的 Mac。

打开本仓库，在 agent 中输入：

```text
/setup-mac
```

agent 会先盘点环境，通过问题确认需求，再按已确认范围补装和配置，最后验证并交接。**不会默认重装已有工具、替换版本管理器、重写 shell 配置或开启自动升级。**

## 入口与兼容性

核心 skill 是 [.agents/skills/setup-mac/SKILL.md](.agents/skills/setup-mac/SKILL.md)。本仓库不提供 `install-all.sh`、一键 Brewfile 或自动修改系统的总控程序；`utilities/` 只存放用户选择后可以安装的实用工具。

| Agent | 项目入口 | 使用方式 |
|---|---|---|
| Claude Code | `.claude/skills/setup-mac` 指向核心 skill | `/setup-mac` |
| Gemini CLI | `.gemini/commands/setup-mac.toml` | `/setup-mac` |
| Cursor | `.cursor/skills/setup-mac` 指向核心 skill | 使用 skill 选择器；若当前版本提供该 slash command，可输入 `/setup-mac` |
| Codex | 原生发现 `.agents/skills/` | `$setup-mac` 或 `/skills` 选择；不能保证它把 `/setup-mac` 识别为自定义命令 |
| 其他 agent / 不识别命令的版本 | `AGENTS.md` 和核心 skill | 使用下面的普通对话入口 |

```text
请阅读 AGENTS.md 和 .agents/skills/setup-mac/SKILL.md，执行 setup-mac。
先检查已有环境，再和我确认需要配置的内容，不覆盖原有配置。
```

**“任意 agent”不能由一个仓库保证相同的工具名称或 slash command 语法。** skill 优先调用实际可用的 `AskUserQuestions`；可适配 `AskUserQuestion`、`request_user_input` 等宿主工具，没有交互工具时使用普通对话。不会虚构工具、绕过宿主权限，或因缺少某个名称而放弃盘点。详见 [agent 兼容说明](docs/agent-compatibility.md)。

## 可以配置什么

| 模块 | 内容 | 默认策略 |
|---|---|---|
| [基础开发环境](docs/development.md) | Apple 开发工具、Homebrew、Git、Node/nvm、Python/uv、pipx | 先识别现有版本和管理渠道，再补缺 |
| [AI CLI](docs/ai-cli-upgrade.md) | Claude、Codex、Kimi、Grok、Cursor Agent、Gemini；traex 待来源确认 | 每个命令保留原渠道，不强行装齐 |
| [终端工具](docs/terminal-cheatsheet.md) | yazi、glow、radio-active、spotatui、surge、ripgrep、PicGo | 按需要选择，媒体/发布/上传功能单独确认 |
| [后台删除](docs/rm-async.md) | `rm_async` 多路径、每项 ID、`rm_progress` 状态/估算 | 可选；安装不代表允许删除用户文件 |
| [升级维护](docs/ai-cli-upgrade.md#定时升级由-agent-按本机生成) | 按已安装渠道升级、可选 launchd 定时运行 | 默认手动；定时执行需要用户选择 |

上游核验日期：**2026-08-31**。[来源索引](docs/sources.md)记录原项目和安装文档；执行配置时仍应检查当前官方说明。没有确认来源的项目只报告，不猜包名、不安装。

## 已有 Mac 的处理原则

- 可用的旧环境优先保留。发现 nvm、fnm、mise、pyenv、conda 等已有管理器时，不为了统一目录而再装一套。
- 多版本、多渠道或 shell 初始化冲突，先给出差异和建议。只有用户选择迁移后才变更 PATH 或默认版本。
- 改动前备份将修改的文件；修改自己的标记块，保留文件其余内容。再次运行不重复追加、不重复建定时任务。
- 检测到公司管理策略、代理、证书、权限限制时，遵循现有策略；不关闭安全功能。
- 凭据由用户在官方登录流程或本机配置中输入；不写进仓库、报告或 shell 历史。

## 文档与记录

- [盘点、变更与回滚](docs/workflow.md)
- [配置需求问答](.agents/skills/setup-mac/references/questions.md)
- [本机报告模板](templates/setup-report.md)：实际报告写入被 Git 忽略的 `.local/`，不提交机器信息。
- [附件原文](docs/imported/README.md)：两份历史附件原样保留。原文不是当前安装指令，采用核验后的指南。
- [验证说明](docs/validation.md)：区分脚本验证、安装成功、认证成功与实际功能可用。

维护本仓库时请更新来源和验证记录。不要把个人用户名、机器路径、令牌、旧任务 ID 或固定的 Node 版本目录作为新机器的默认值。
