# Warp Terminal

工具 ID：`warp`。官方：[下载](https://www.warp.dev/download)，[warpdotdev/Warp](https://github.com/warpdotdev/Warp) 是官方问题反馈仓库，**不是客户端完整源码仓库**。

## 安装与配置

```sh
brew install --cask warp
```

依据：[Homebrew warp](https://formulae.brew.sh/cask/warp)。也可通过官方发行包安装，保留当前渠道。执行前核对最低 macOS 与架构，不从第三方同名 GitHub 项目取安装包。

保留主题、快捷键、shell 设置和登录状态。新装使用默认配置，不把 Warp 设为默认终端，不自动开启云端 agent、同步、付费计划或导入秘密。需要账号的功能由用户走官方认证。

## 验证与冲突

检查 App 版本、签名与包记录；可用 GUI 时验证一个新终端窗口，记录交互 shell 的实际环境。`auto` 模式允许与 Otty/系统 Terminal 并存，不为“统一终端”卸载或迁移用户现有终端。认证/云端能力没有操作就标记未验证。

核验日期：2026-08-31。执行时重新核验当前官方说明；已有环境按 [选择与冲突规则](../guides/selection-and-conflicts.md) 处理。
