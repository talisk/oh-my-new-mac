# 配置目录

每类一个目录，每个工具/App 一个文件。分类 README 是 **问答工具清单的唯一来源**；skill 每次读取它们展示选项，不另外维护一份容易过期的工具列表。

| 分类 | 内容 | 条目数 |
|---|---|---|
| [基础环境](base/README.md) | Apple 开发工具、Homebrew、Git、nvm/Node、pyenv/Python/uv、pipx | 9 |
| [AI tools](ai-tools/README.md) | Kimi、Codex、Grok、Claude Code、Pi、OpenCode、Cursor CLI、Gemini | 8 |
| [实用脚本](scripts/README.md) | 后台删除、CLI 升级维护 | 2 |
| [CLI 工具](cli-tools/README.md) | 文件/Markdown/搜索/媒体/部署/图床工具 | 13 |
| [GUI 应用](gui-apps/README.md) | Otty、Warp、Zed、Chrome、Codex Desktop、Cursor Desktop、Caffeine、Amphetamine | 8 |

总计 40 个配置条目。全选指以上条目，不包含归档附件中出现的额外软件、网页推荐的可选插件，或未来新增条目；执行计划应保存本次展开的快照。必要依赖按所选策略列出，不能绕过黑名单。

## 如何选择

- **全部配置，冲突询问**：覆盖整个目录，遇到实际冲突再问；这是全选时的默认冲突策略。
- **一键全选，自动处理**：覆盖整个目录，agent 自行选择安全的保留、合并、补装方案，不逐项问冲突；无法无损处理的项跳过并记录。
- **白名单**：只处理提到的工具或分类；缺失的未列依赖默认不增装。
- **黑名单**：全部或所选分类减去排除项；排除优先，禁止把排除项作为隐藏依赖增装。
- **仅检查**：展示盘点与建议，不安装或修改用户环境。

名单也可组合：“基础环境和 AI tools，排除 grok、gemini；冲突自动处理”。规则、依赖与消歧细节见 [选择与冲突规则](guides/selection-and-conflicts.md)，交互设计见 [问题模板](../.agents/skills/setup-mac/references/questions.md)。

## 共用方法

- [盘点、修改与回滚](guides/workflow.md)
- [Agent 入口 / AskUserQuestions 适配](guides/agent-compatibility.md)
- [来源核验方法](guides/sources.md)
- [验证与行为验收](guides/validation.md)

旧 `terminal-cheatsheet.md` 已按工具拆分，旧 `ai-cli-upgrade.md` 已拆到 AI tools 和实用脚本。两份原始附件仅作 [历史归档](../archive/reference-inputs/README.md)，不再作为安装入口。
