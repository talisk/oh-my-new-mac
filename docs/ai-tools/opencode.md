# OpenCode

工具 ID：`opencode`；命令：`opencode`。原项目：[anomalyco/opencode](https://github.com/anomalyco/opencode)，[配置文档](https://opencode.ai/docs/config/)。不要把历史同名项目的安装说明混进来。

## 安装与配置

上游优先推荐自己的 Homebrew tap：

```sh
brew install anomalyco/tap/opencode
```

另有 `brew install opencode`（Homebrew core，发布节奏可能不同），以及 `npm install -g opencode-ai@latest`。只选一个渠道；已有 core/npm 安装不因推荐 tap 而自动迁移。

按官方层级识别全局 `~/.config/opencode/opencode.json`、JSONC、项目配置与显式覆盖项；macOS 企业管理设置优先，不尝试覆盖。TUI 设置见 `~/.config/opencode/tui.json`，不要把旧版本的 keybind/theme 字段盲写进运行时配置。仅合并已选择的设置，保留模型、提供方、权限、MCP 和主题。首次启动按 UI 的官方连接流程由用户登录；不生成带真实 key 的样例配置。

## 验证与维护

`opencode --version`、新 shell 路径和安装来源均需一致。tap 渠道更新 `brew upgrade anomalyco/tap/opencode`，core 渠道 `brew upgrade opencode`，npm 渠道 `npm install -g opencode-ai@latest`。

`auto` 模式保留当前兼容渠道；若只缺一处初始化则备份后修复，不卸载另一套、不覆盖项目权限设置。未验证的认证或模型请求在交接中单列。

核验日期：2026-08-31。执行时重新核验当前官方说明；已有环境按 [选择与冲突规则](../guides/selection-and-conflicts.md) 处理。
