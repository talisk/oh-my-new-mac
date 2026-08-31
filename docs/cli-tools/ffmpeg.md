# FFmpeg / ffplay

工具 ID：`ffmpeg`；包含 `ffplay` 播放器。原项目：[FFmpeg/FFmpeg](https://github.com/FFmpeg/FFmpeg)，[官方分发入口](https://ffmpeg.org/download.html)，[Homebrew ffmpeg](https://formulae.brew.sh/formula/ffmpeg)。

安装 `brew install ffmpeg`，核验 `ffmpeg -version`、`ffplay -version`。radio-active 默认播放器需要 ffplay；安装包的依赖与功能以当前构建为准，不能把同名精简构建当作播放器一定可用。

无需默认配置，不修改系统媒体关联。安装不授权录屏、录音、转码或播放用户文件。全选表示安装组件，不表示自动运行媒体任务。已有版本保留，Brew 渠道维护 `brew upgrade ffmpeg`；不全局清理编解码库来解决冲突。

核验日期：2026-08-31。执行时重新核验当前官方说明；已有环境按 [选择与冲突规则](../guides/selection-and-conflicts.md) 处理。
