# Codex Desktop

工具 ID：`codex-desktop`；别名：codex-app。这是桌面产品，和 [Codex CLI](../ai-tools/codex.md) 的 `codex` cask 分开选择、分开验收。

## 当前分发状态需特别核验

官方入口：[OpenAI Codex app 文档](https://developers.openai.com/codex/app/)。[openai/codex](https://github.com/openai/codex) 是 CLI/相关组件原项目，不能据此推断桌面 App 安装命令。

2026-08-31 核验时，官方 app 文档入口跳转到 ChatGPT 桌面说明；[Homebrew codex-app](https://formulae.brew.sh/cask/codex-app) 元数据标记 `deprecated`，原因 `discontinued`，并给出 `chatgpt` replacement。这说明**该 cask 的分发状态变化**，不能仅据此断言所有 Codex 桌面功能已停止服务。

因此本项不把 `brew install --cask codex-app` 作为正常新装默认，更不能把 `brew install --cask codex` 当桌面安装，或无提示改装 ChatGPT。

## 配置决策

- 已有独立 Codex.app：核对官方身份、版本和可运行性，保留现有应用、任务与配置，不降级到陈旧 cask。
- 新装：执行当日重新打开官方入口，核验请求的桌面产品名称、受支持分发包、架构及安装方法；有明确匹配来源才安装。
- 官方当前仅提供其他产品承载功能：`ask` 模式说明变化并询问是否接受；`auto` 模式跳过该项并记录来源变化，不自行把白名单中的 Codex Desktop 替换成另一个产品。

不动既有账号、工作区、agent 权限与同步设置。安装和登录分别记录；无受支持的确切安装来源就报告“待来源确认”，不会拖住其他全选项。

核验日期：2026-08-31。执行时重新核验当前官方说明；已有环境按 [选择与冲突规则](../guides/selection-and-conflicts.md) 处理。
