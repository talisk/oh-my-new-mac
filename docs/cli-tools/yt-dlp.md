# yt-dlp：媒体下载组件

工具 ID：`yt-dlp`。原项目：[yt-dlp/yt-dlp](https://github.com/yt-dlp/yt-dlp)，[Homebrew yt-dlp](https://formulae.brew.sh/formula/yt-dlp)。

安装 `brew install yt-dlp`，验证 `yt-dlp --version`。作为 spotatui 的可选组件时，先确认所装构建支持该来源，再按选择范围安装；全选可独立安装，但不自动启用音源。

保留既有参数、cookies 引用和 XDG 配置，不导出浏览器 cookies，不以真实下载作为装机验收。合并音视频需要的 FFmpeg 等组件按当前上游说明与用户依赖策略处理，不隐藏增装。

Brew 渠道升级 `brew upgrade yt-dlp`，不照搬独立二进制的 `yt-dlp -U`。`auto` 下保留兼容渠道，来源或权限不满足就跳过对应功能，不扩大访问范围。

核验日期：2026-08-31。执行时重新核验当前官方说明；已有环境按 [选择与冲突规则](../guides/selection-and-conflicts.md) 处理。
