# Grok CLI

工具 ID：`grok`；命令：`grok`。原项目：[xai-org/grok-build](https://github.com/xai-org/grok-build)，[官方 CLI reference](https://docs.x.ai/build/cli/reference)。不要用其他同名社区 CLI 替代。

## 安装与配置

官方安装入口 `https://x.ai/cli/install.sh`。下载并检查当前平台、写入范围及签名/校验说明，再执行本地安装器；不猜测 npm 包名或静默参数。

保留既有配置和组织策略。`grok login` 或首次启动进入官方认证，登录由用户完成。安装不等于授权远程执行、收费推理或自动上传项目。

## 验证与维护

`grok --version` 与新 shell 的命令来源验证安装；以当前 help 验证所需子命令。原生安装更新使用 `grok update`，进入无人值守维护前确认无终端行为。

`auto` 下遇到同名非官方 `grok` 不覆盖；可选择不冲突的官方位置并明确调用路径，无法确保身份和路径时跳过该项。只有现有同一官方渠道才直接沿用维护方式。

核验日期：2026-08-31。执行时重新核验当前官方说明；已有环境按 [选择与冲突规则](../guides/selection-and-conflicts.md) 处理。
