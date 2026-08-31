# oh-my-new-mac

给 agent 阅读的 macOS 配置清单、官方安装依据和交互流程。适用于新 Mac，也适用于已有部分开发环境的 Mac。打开仓库后输入：

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

共 40 个配置条目，详见 [docs 总目录](docs/README.md)。共享流程放在 `docs/guides/`；旧速查表与 AI 安装表已拆开，两份附件仅保留在 [历史归档](archive/reference-inputs/README.md)。这不是 `install-all.sh` / Brewfile 包装，`utilities/` 仅存放用户可选的实用脚本实现。

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

## Agent 入口

核心 skill：[.agents/skills/setup-mac/SKILL.md](.agents/skills/setup-mac/SKILL.md)。优先使用真实可用的 `AskUserQuestions` / `AskUserQuestion`；其他工具名与无交互工具的情形按 [兼容说明](docs/guides/agent-compatibility.md) 适配。

| Agent | 项目入口 | 调用 |
|---|---|---|
| Claude Code | `.claude/skills/setup-mac` 链接核心 skill | `/setup-mac` |
| Gemini CLI | `.gemini/commands/setup-mac.toml` | `/setup-mac` |
| Cursor | `.cursor/skills/setup-mac` 链接核心 skill | skill 选择器；版本支持时 `/setup-mac` |
| Codex | 原生发现 `.agents/skills/` | `$setup-mac` 或 `/skills` 选择 |
| 其他 / 不识别 slash 的版本 | `AGENTS.md` 与核心 skill | 普通对话入口 |

仓库不能保证所有 agent 采用同一种 slash 语法。不识别时输入：

```text
请阅读 AGENTS.md 和 .agents/skills/setup-mac/SKILL.md，执行 setup-mac。
先展示分类工具清单，我会选择全选、白名单或黑名单，并决定冲突是否询问。
```

## 已有 Mac 与来源保障

配置前盘点来源和版本，备份将修改的真实文件，合并必要差异并避免重复加载；再次运行可继续补缺，不重装已有环境。机器私有记录放在 `.local/`，不进入 Git。

每个工具页独立记录原项目、官方安装/配置依据和核验日期。没有公开实现仓库的 App 如实标注官方分发来源，不用同名 GitHub 项目替代。Otty/Caffeine 的发行方、Codex Desktop 的当前分发限制等见各自条目；执行时重新核验，不凭旧页面猜安装命令。

更多说明：[盘点与回滚](docs/guides/workflow.md) · [来源方法](docs/guides/sources.md) · [验证与行为场景](docs/guides/validation.md) · [报告模板](templates/setup-report.md)。
