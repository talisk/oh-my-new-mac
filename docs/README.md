# 配置目录

每类一个目录，每个工具/App 一个文件。分类 README 是 **问答工具清单的唯一来源**；skill 每次读取它们展示选项，不另外维护一份容易过期的工具列表。

| 分类 | 内容 |
|---|---|
| [基础环境](base/README.md) | 开发工具、包管理器、语言环境及其管理器 |
| [AI tools](ai-tools/README.md) | AI CLI / agent 工具 |
| [实用脚本](scripts/README.md) | 独立实用脚本与维护工具 |
| [CLI 工具](cli-tools/README.md) | 文件/Markdown/搜索/媒体/部署/图床等终端工具 |
| [GUI 应用](gui-apps/README.md) | 终端、编辑器、浏览器、AI 桌面及其他 macOS App |

全选按当前分类 README 展开，不固定工具数量。通过 `/add-config` 添加的条目会在下次需求确认时列出；一轮配置开始后保存清单快照，不自动扩展到后来新增条目或网页推荐的插件。标“待核验”的条目在核验完成前不能执行安装。必要依赖按所选策略列出，不能绕过黑名单。

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
- [收录配置：add-config](guides/adding-config.md)
- [通过 GitHub Template 创建个人仓库](guides/template.md)

配置方法维护在单工具文档中，分类 README 只负责发现与选择。新增或更新条目不需要复制全套速查表，也不需要修改 setup-mac 的工具列表。
