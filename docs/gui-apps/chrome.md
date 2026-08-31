# Google Chrome

工具 ID：`chrome`；别名：google-chrome。官方：[Google Chrome](https://www.google.com/chrome/)，[Homebrew google-chrome](https://formulae.brew.sh/cask/google-chrome)。Chrome 产品不是公开 GitHub 源码分发；Chromium 不能替代此处请求的 Chrome。

## 安装与配置

```sh
brew install --cask google-chrome
```

也可从 Google 官方下载对应 Mac 版本。检查当前平台要求与现有 App；保留用户已有稳定/Beta 等渠道，不因为全选就覆盖成不同发布通道。

不改默认浏览器，不登录同步，不导入其他浏览器资料，不安装全套扩展；保留所有已有 profile、证书与企业管理策略。安装器需要的系统动作按宿主权限执行。

## 验证与冲突

检查 App 身份/版本和签名；可用 GUI 时打开一个不包含用户秘密的新标签页验证。`auto` 模式遇到现有可用 Chrome 直接保留，不用 `--force` 或 `--zap` 接管已有 App。Brew 与应用自动更新不要同时触发。

核验日期：2026-08-31。执行时重新核验当前官方说明；已有环境按 [选择与冲突规则](../guides/selection-and-conflicts.md) 处理。
