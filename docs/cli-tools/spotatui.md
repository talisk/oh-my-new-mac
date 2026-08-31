# spotatui：音乐 TUI

工具 ID：`spotatui`。

原项目：[LargeModGames/spotatui](https://github.com/LargeModGames/spotatui)，[安装 Wiki](https://github.com/LargeModGames/spotatui/wiki/Installation)。macOS 的上游 Brew 方式：

```sh
brew tap LargeModGames/spotatui
brew install spotatui
```

先检查 tap 是否已有，验证 `spotatui --help`，再由用户选择是否启动认证/播放。Spotify 流媒体播放需要 Premium 和上游要求的认证设置；不要自动创建开发者应用或接受付费条款。

当前 README 同时介绍多音源，但注明一些非 Spotify 音源尚未在 macOS 构建启用。**不能承诺这台 Mac 可用 YouTube/本地文件/网络电台等全部音源**；以实际构建和首次来源选择器为准，功能不可用就记录，不盲目装依赖。

选择 YouTube 来源时先确认构建支持，再检查 [yt-dlp](yt-dlp.md) 等依赖；它们的安装与维护见独立条目。仅安装 spotatui 不代表授权启用所有音源或补装可选下载器。

配置位于绝对 `XDG_CONFIG_HOME` 下的 `spotatui/config.yml`，否则 `~/.config/spotatui/config.yml`。帮助 `?`，来源/设备 `d`，加入队列 `z`，队列 `Shift+Q`。配置、快捷键和隐私/Discord 集成按实际版本展示，让用户决定，不能把默认联网集成当作已获授权。Brew 渠道更新 `brew upgrade spotatui`。


核验：2026-08-31。安装前按 [冲突策略](../guides/selection-and-conflicts.md) 处理已有渠道；`auto` 模式由 agent 自行保留/合并/跳过，不反复提问。
