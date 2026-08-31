# Claude Code

工具 ID：`claude-code`；命令：`claude`。原项目：[anthropics/claude-code](https://github.com/anthropics/claude-code)，[官方安装与维护](https://code.claude.com/docs/en/setup)。

## 安装与配置

新装可用 `brew install --cask claude-code`，或使用官方 `https://claude.ai/install.sh` 安装器；后者先下载、审阅，再执行本地文件。二选一，不把原生安装再用 Brew 覆盖。npm 安装在当前上游已标记 deprecated，不作为新装默认。

用 `whence -a claude` 和包记录判断来源，保留已有配置、MCP、模型提供方和组织策略。启动 `claude` 的官方登录流程由用户完成；不写入示例 API key，不导入个人插件清单。安装不授权调用付费模型或放宽 agent 权限。

## 验证与维护

`claude --version` 验证二进制；新 shell 再确认路径。认证与真实请求单独记录，不因版本号可用就宣布登录成功。

Brew 渠道使用 `brew upgrade --cask claude-code`；原生渠道按当前官方更新机制处理。发现旧 npm 或 `claude-code@latest` cask 时，先识别真实 token/来源。`auto` 模式保留能用的现有渠道；只有确认不能使用且迁移可备份回滚时才按官方迁移方法修复，不卸载另一套来掩盖冲突。

核验日期：2026-08-31。执行时重新核验当前官方说明；已有环境按 [选择与冲突规则](../guides/selection-and-conflicts.md) 处理。
