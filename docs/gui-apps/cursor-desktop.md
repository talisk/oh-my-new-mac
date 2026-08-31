# Cursor Desktop

工具 ID：`cursor-desktop`。官方：[getcursor/cursor](https://github.com/getcursor/cursor)（产品入口，非完整客户端源码），[下载](https://cursor.com/downloads)，[Homebrew cursor](https://formulae.brew.sh/cask/cursor)。

## 安装与配置

```sh
brew install --cask cursor
```

也可使用官方发行包；保留已有渠道和发布通道。桌面 cask 附带的 `cursor` 是编辑器命令，不能充当 [Cursor Agent](../ai-tools/cursor-cli.md) 的 `agent` 安装结果。

保留 `~/Library/Application Support/Cursor`、`~/.cursor`、用户设置、扩展、工作区与认证。不要用 `--zap` 清理，也不要自动导入 VS Code 的全部秘密与扩展。新装不改默认编辑器或 Git editor，不自动购买订阅。

## 验证与冲突

核对 App bundle/版本/签名，检查实际 CLI artifact；GUI 可用时打开本仓库文档验证，不让 agent 编辑用户其他项目。`auto` 模式遇到同名 App 先核验来源，兼容可用就保留；无法无损迁移就跳过接管，记录当前状态。

核验日期：2026-08-31。执行时重新核验当前官方说明；已有环境按 [选择与冲突规则](../guides/selection-and-conflicts.md) 处理。
