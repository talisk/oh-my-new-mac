# radio-active：终端电台（命令名 radio）

工具 ID：`radio-active`。

原项目：[dpnkrpl/radio-active](https://github.com/dpnkrpl/radio-active)。上游推荐 `pipx install radio-active`；pipx 缺失时按 [pipx](../base/pipx.md) 配置，避免污染系统 Python。

默认播放器 ffplay 依赖 [FFmpeg](ffmpeg.md)；选择其他后端时可参考 [mpv](mpv.md)。先检查后端是否已存在；缺失时按名单/依赖策略补装，不重复维护这些工具的安装步骤。

```sh
radio --help
radio --search jazz
radio --last
radio --player mpv
```

`--search` 可能直接播放，不能把它当作纯只读检查。首次网络播放、录音或后台播放先由用户选择。默认配置 `~/radioactive/config.ini`、录音 `~/radioactive/recordings`，保留已有收藏和配置。升级 `pipx upgrade radio-active`，不以更新为由清空收藏。更多选项直接查看当前 `radio --help`，详细参数以已安装版本为准。


核验：2026-08-31。安装前按 [冲突策略](../guides/selection-and-conflicts.md) 处理已有渠道；`auto` 模式由 agent 自行保留/合并/跳过，不反复提问。
