# mpv：媒体播放器

工具 ID：`mpv`。原项目：[mpv-player/mpv](https://github.com/mpv-player/mpv)，[官方安装](https://mpv.io/installation/)，[Brew mpv](https://formulae.brew.sh/formula/mpv)。

安装 `brew install mpv`，验证 `mpv --version`。这是 CLI 工具条目；不要据此安装同名第三方 GUI wrapper。

保留 XDG 配置目录下的 mpv 设置、快捷键和脚本。新装无需定制配置，不改变默认播放器；作为 radio-active 可选播放后端时，核验当前 radio 参数再切换。缺省不联网播放或读取私人媒体。

`auto` 模式保留已配置后端，mpv 与 FFmpeg 可共存，不能为了选一个就卸载另一个。Brew 渠道更新 `brew upgrade mpv`。

核验日期：2026-08-31。执行时重新核验当前官方说明；已有环境按 [选择与冲突规则](../guides/selection-and-conflicts.md) 处理。
