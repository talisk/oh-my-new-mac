# Otty Terminal

工具 ID：`otty`。这里指 [otty.sh](https://otty.sh/) 的 Otty（Appmakes），[官方文档](https://docs.otty.sh/)，bundle ID 为 `io.appmakes.otty`。GitHub 上 `otty-shell/otty` 是另一个同名项目，不能作为本 App 的来源。

## 安装与配置

本产品未确认公开实现仓库；采用官方分发与 [Homebrew cask otty](https://formulae.brew.sh/cask/otty) 元数据，来源类型如实记录。

```sh
brew install --cask otty
```

先检查当前 cask 的架构/macOS 支持。没有 Brew 或已用官方发行版时，可从官网选择对应架构下载；不为一个 App 强装被排除的包管理器。已有 Otty.app 先核对 bundle ID 与来源，不覆盖同名不同产品。

保留 `~/.config/otty`、主题、会话和 shell integration；新装采用 App 默认设置，不切换系统默认终端，不自动导入其他终端全部配置。cask 可提供 `otty` 命令，须核对实际 artifact。

## 验证与冲突

包记录、App 签名/系统验证、bundle ID/版本分别核实。仅在可操作目标 GUI 时打开测试窗口，验证实际 shell 与 Node/Python 来源；不修改已有窗口会话。

`auto` 下保留已有匹配产品，只补缺。无法确定同名产品身份时跳过而不是任选一个。更新沿原渠道，不同时运行 App 更新器与 Brew 升级。

核验日期：2026-08-31。执行时重新核验当前官方说明；已有环境按 [选择与冲突规则](../guides/selection-and-conflicts.md) 处理。
