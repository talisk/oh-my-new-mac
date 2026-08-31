# Cursor CLI / Agent

工具 ID：`cursor-cli`；别名：Cursor Agent；当前命令：`agent`，历史命令：`cursor-agent`。官方入口：[getcursor/cursor](https://github.com/getcursor/cursor)（非 CLI 实现源码），[CLI 安装与使用](https://cursor.com/help/integrations/cli)。

## 安装与配置

使用官方 `https://cursor.com/install` 安装器，先下载审阅再执行。不要为了 CLI 顺带安装 [Cursor Desktop](../gui-apps/cursor-desktop.md)。桌面编辑器的 `cursor` 命令与本项不是同一个二进制。

先确定 `agent` 的真实路径和发行方，防止命令同名。当前官方认证入口是 `agent auth`，用户通过官方流程登录。保留现有 Cursor 配置、规则与提供方，安装不授权执行项目任务或 API 请求。

## 验证与维护

来源确认后用 `agent --version` 验证；当前文档更新命令为 `agent update`。若现有版本只有 `cursor-agent`，按该二进制 help 和官方说明确定是否支持 `cursor-agent update`，不擅自改名。

`auto` 模式保留可用的官方旧渠道，修复初始化时不覆盖其他项目的 `agent`。有同名冲突且没有可验证的共存方法就跳过该 CLI，桌面版仍可独立处理。

核验日期：2026-08-31。执行时重新核验当前官方说明；已有环境按 [选择与冲突规则](../guides/selection-and-conflicts.md) 处理。
