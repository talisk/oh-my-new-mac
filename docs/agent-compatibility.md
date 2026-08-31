# Agent 入口与提问工具兼容

核验日期：2026-08-31。仓库只能提供符合宿主协议的文件，不能让不支持自定义命令的 agent 凭空接受 `/setup-mac`。用户的目标流程保持一致，入口语法和工具名称允许适配。

## 单一 skill，多种发现方式

| 宿主 | 本仓库文件 | 依据与限制 |
|---|---|---|
| Codex | `.agents/skills/setup-mac/SKILL.md` | [官方 skills 文档](https://learn.chatgpt.com/docs/build-skills)说明项目发现与 `$`、`/skills` 调用；不能推导出任意 `/名称` 自动可用 |
| Claude Code | `.claude/skills/setup-mac` 相对符号链接；`CLAUDE.md` 指向 AGENTS | [官方 skills 文档](https://code.claude.com/docs/en/skills)支持项目 skill、同名 slash 调用和链接目录；用户/企业同名 skill 可能覆盖项目项 |
| Gemini CLI | `.gemini/commands/setup-mac.toml`；`GEMINI.md` | [原项目 custom commands](https://github.com/google-gemini/gemini-cli/blob/main/docs/cli/custom-commands.md)支持项目 TOML，提示模型读取核心 skill，不注入任何安装 shell 命令 |
| Cursor | `.cursor/skills/setup-mac` 相对符号链接 | [官方 skills 文档](https://cursor.com/help/customization/skills)提供项目目录；实际版本是否跟随链接、是否显示 `/setup-mac` 需要现场验证，失败用普通对话入口 |
| Grok/Kimi/Trae/其他 | 根 AGENTS + 普通对话入口 | 没有逐个宿主启动验证，不宣称 slash 路由通用；按实际 discovery/help 配置，不擅自改全局 agent 设置 |

项目必须经过宿主的工作区信任/权限步骤才能运行本机 shell。不要使用 bypass/YOLO 参数让 setup-mac“自动成功”。若宿主缓存技能列表，按官方方式刷新或重开会话；不要复制多份不一致的 SKILL.md。

## AskUserQuestions 适配

`AskUserQuestions` 是需求中的首选交互能力名，不是这里实现的服务。agent 应检查本轮工具列表和真实 schema：

1. 存在 `AskUserQuestions`：用它分轮询问。
2. 只有 `AskUserQuestion` 或其他同等工具：用其实际参数与多选能力，不照搬其他工具 schema。
3. `request_user_input` 仅在当前模式允许时使用；不能把需求选择工具当作宿主审批工具。
4. 都没有或当前不可调用：普通对话提问并等待，继续可做的只读工作。

不得为了工具名称匹配安装不明 MCP、虚构调用结果、默认代答或自动接受迁移方案。

## 可迁移验证场景

- 全新 arm64 Mac：没有 Brew/语言环境，先确认用途，不自动装全套 AI CLI。
- 旧 Mac：Node 已由 fnm 管理、Codex npm/Brew 双装、有自定义 zsh 函数，保留生效渠道，提供迁移建议。
- 非 zsh / 自定义 ZDOTDIR：不把片段盲写 `~/.zshrc`；后台删除实现仅提供 zsh，先说明限制。
- 无 AskUserQuestions：以普通对话完成相同确认，不停止盘点，也不默许写入。
- 离线/需公司授权：跳过受限项目，给出可执行的下一步，不使用未知镜像绕过。
- 再次运行：读取上次 `.local/` 报告，核实变化，不重复安装、插入标记块或创建计划任务。

这些是行为验收用例，不是已经在所有 agent 中运行通过的声明。
