# Zed

工具 ID：`zed`。原项目：[zed-industries/zed](https://github.com/zed-industries/zed)，[macOS 安装](https://zed.dev/docs/macos)。

## 安装与配置

```sh
brew install --cask zed
```

[Homebrew zed](https://formulae.brew.sh/cask/zed) 提供 App 与 `zed` 命令；官方 macOS 发行包是另一个可选渠道，不双装。检查已有 bundle、版本与设置后再决定保留/新增。

保留 `~/.config/zed/`、快捷键、扩展、主题和模型提供方。新装不自动改默认编辑器、Git editor、文件关联，也不顺带添加 AI agent/订阅。需要的配置按当前 [官方配置文档](https://zed.dev/docs/configuring-zed) 合并，不能覆盖整个 settings 文件。

## 验证与冲突

检查 App 版本与来源，CLI 存在时 `zed --version`；可用 GUI 时打开本仓库的只读文档进行验收。`auto` 模式与其他编辑器并存；已有 `zed` 同名命令时不要强行 link 覆盖，保留原命令并记录 App 可用、CLI 集成未完成。

核验日期：2026-08-31。执行时重新核验当前官方说明；已有环境按 [选择与冲突规则](../guides/selection-and-conflicts.md) 处理。
