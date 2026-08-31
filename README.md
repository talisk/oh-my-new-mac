# oh-my-new-mac

给 agent 阅读的 macOS 配置清单、官方安装依据和交互流程，也是一份可通过 GitHub **Use this template** 创建个人“Mac 配置器仓库”的模板。适用于新 Mac，也适用于已有部分开发环境的 Mac。

从 [模板仓库](https://github.com/talisk/oh-my-new-mac) 选择 **Use this template → Create a new repository**，将自己的仓库 clone 到 Mac 后用 agent 打开。只有能访问模板的人才能使用它；Template 不会改变仓库的可见性。详见 [模板使用说明](docs/guides/template.md)。

两个入口分别负责收录和配置：

```text
/add-config homebrew
```

检索 Homebrew 的官方来源、安装/配置和基本用法，更新当前仓库的既有条目；新工具按分类创建独立文件并加入清单。**只收录，不安装**。接着可输入：

```text
/setup-mac
```

agent 先盘点并展示分类工具列表，再确认范围、完成安装配置和验证。可以一键全选并让 agent 自行处理冲突，也可以提供白名单/黑名单；**默认保留可用环境，冲突默认询问，用户选择自动处理后不再逐项问。**

## 按分类维护，每个工具一个文件

| 分类 | 内容 |
|---|---|
| [基础环境](docs/base/README.md) | Homebrew、Apple CLT、Git、nvm/Node、pyenv/Python/uv、pipx |
| [AI tools](docs/ai-tools/README.md) | Kimi Code、Codex、Grok、Claude Code、Pi、OpenCode、Cursor CLI、Gemini |
| [实用脚本](docs/scripts/README.md) | 多目录异步删除、CLI 升级维护 |
| [CLI 工具](docs/cli-tools/README.md) | yazi、glow、ripgrep、fd、fzf、zoxide、radio-active、spotatui、FFmpeg、mpv、yt-dlp、surge、PicGo Core |
| [GUI 应用](docs/gui-apps/README.md) | Otty、Warp、Zed、Chrome、Codex Desktop、Cursor Desktop、Caffeine、Amphetamine |

完整条目以当前仓库的 [docs 总目录](docs/README.md) 和分类 README 为准，用户可持续扩充。共享流程放在 `docs/guides/`。这不是 `install-all.sh` / Brewfile 包装，`utilities/` 仅存放用户可选的实用脚本实现。

基础环境补齐了 [Homebrew](docs/base/homebrew.md)、[nvm](docs/base/nvm.md)、[system/nvm Node 版本协调](docs/base/node.md) 与 [pyenv](docs/base/pyenv.md) + [uv](docs/base/uv.md)。不替换系统 Python，不为“统一”强行移除 Brew/项目依赖；未能完全统一的版本会明确报告。

## 选择方式

在 `/setup-mac` 后通过问答选择，也可直接附上自然语言要求：

```text
全部配置，冲突你自行解决，不用再问。
只安装 Homebrew、nvm、Node、pyenv、Python、uv；允许必要依赖。
基础环境和 AI tools 全选，排除 grok、gemini；冲突时问我。
除 GUI 工具和 surge 以外都配置，冲突自动处理。
只检查现有环境并给建议，不安装。
```

这是对话示例，不是仓库实现的命令行参数。全选会展开当前目录；白名单默认只处理列出的组件；黑名单优先，依赖不能绕过排除。自动模式会实际完成可安全解决的冲突，无法无损处理的项跳过并记录。详见 [选择与冲突规则](docs/guides/selection-and-conflicts.md)。

全选不代表开启定时更新、登录启动、默认 App 切换、永久防休眠、云同步、付费请求或删除真实文件。系统审批和账号登录仍按宿主要求完成，无法自动处理时记录为待用户操作。

## 收录自己的配置

`/add-config <产品名或官方 URL>` 会先检索当前目录，已存在则更新原文件，尚未收录则创建 `docs/<分类>/<工具-id>.md` 并更新分类索引。例如 `homebrew` 和 `brew` 指向同一条目，Cursor CLI 与 Cursor Desktop 则分别处理。

每个条目收集来源、平台与依赖、安装、初始化、配置位置、基本使用、旧环境兼容、验证、更新和回滚。未核验的部分明确标注，不猜包名或配置键；实际安装时仍会重新核验。详见 [收录指南](docs/guides/adding-config.md)。

新条目自动进入下一次 setup-mac 的清单，无需修改该 skill 的硬编码列表；已经开始的一次配置不会悄悄扩展到新加入的工具。副本的修改留在自己的仓库，不自动推送模板上游。

## Agent 入口

核心 skill：[setup-mac](.agents/skills/setup-mac/SKILL.md) 和 [add-config](.agents/skills/add-config/SKILL.md)。需要问答时优先使用真实可用的 `AskUserQuestions` / `AskUserQuestion`；其他工具名与无交互工具的情形按 [兼容说明](docs/guides/agent-compatibility.md) 适配。

| Agent | 项目入口 | 调用 |
|---|---|---|
| Claude Code | `.claude/skills/` 分别链接两个核心 skill | `/setup-mac`、`/add-config homebrew` |
| Gemini CLI | `.gemini/commands/` 的两个 TOML 入口 | `/setup-mac`、`/add-config homebrew` |
| Cursor | `.cursor/skills/` 分别链接两个核心 skill | skill 选择器；版本支持时使用同名 slash 命令 |
| Codex | 原生发现 `.agents/skills/` | `$setup-mac`、`$add-config homebrew` 或 `/skills` 选择 |
| 其他 / 不识别 slash 的版本 | `AGENTS.md` 与核心 skill | 普通对话入口 |

仓库不能保证所有 agent 采用同一种 slash 语法。不识别时输入：

```text
请阅读 AGENTS.md 和 .agents/skills/setup-mac/SKILL.md，执行 setup-mac。
先展示分类工具清单，我会选择全选、白名单或黑名单，并决定冲突是否询问。
```

收录入口的普通对话等价形式：

```text
请阅读 AGENTS.md 和 .agents/skills/add-config/SKILL.md，为当前仓库收录 homebrew 的配置方法，不执行安装。
```

## 已有 Mac 与来源保障

配置前盘点来源和版本，备份将修改的真实文件，合并必要差异并避免重复加载；再次运行可继续补缺，不重装已有环境。机器私有记录放在 `.local/`，不进入 Git。

每个工具页独立记录原项目、官方安装/配置依据和核验日期。没有公开实现仓库的 App 如实标注官方分发来源，不用同名 GitHub 项目替代。Otty/Caffeine 的发行方、Codex Desktop 的当前分发限制等见各自条目；执行时重新核验，不凭旧页面猜安装命令。

更多说明：[盘点与回滚](docs/guides/workflow.md) · [来源方法](docs/guides/sources.md) · [验证与行为场景](docs/guides/validation.md) · [报告模板](templates/setup-report.md)。
