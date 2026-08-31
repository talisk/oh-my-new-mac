# yazi：文件管理器

工具 ID：`yazi`。

原项目：[sxyazi/yazi](https://github.com/sxyazi/yazi)；[安装](https://yazi-rs.github.io/docs/installation/)、[快速上手](https://yazi-rs.github.io/docs/quick-start/)。先检查终端支持，最小安装 `brew install yazi`，验证 `yazi --version` 和真实 TUI 打开/退出。

按需要另选 fd、ripgrep、fzf、zoxide，安装与来源见 [fd](fd.md)、[fzf](fzf.md)、[zoxide](zoxide.md)。复杂预览依赖不作为默认项：当前上游完整 Homebrew 示例还包含额外媒体/图像包和强制 link 指令；**不要在已有机器照抄 `--overwrite`**，先盘点冲突与具体预览需求。

默认使用 `yazi` 即可。用户需要退出后改变 shell 目录时，按上游 quick-start 的 `--cwd-file` 方法加入 `y` wrapper，并先检查是否已有同名函数/alias；不要覆盖已有快捷入口。配置文件按 [官方配置说明](https://yazi-rs.github.io/docs/configuration/overview/) 与实际 XDG 路径确定；保留自定义 keymap。

| 操作 | 常见默认键（以当前版本帮助为准） |
|---|---|
| 移动/进入/返回 | `h j k l` |
| 打开/退出 | `Enter` 或 `o`；`q` |
| 选择/取消 | `Space`；`Esc` |
| 复制/剪切/粘贴 | `y` / `x` / `p` |
| 新建/重命名/隐藏文件 | `a` / `r` / `.` |
| 帮助 | `F1` 或 `~` |

删除键涉及废纸篓或永久删除，不能用用户文件验证；标签页按键等以运行中的帮助为准，不把历史表的 `t t` 固定写入新配置。升级仅对用户选择的 Brew 包运行 `brew upgrade yazi`。


核验：2026-08-31。安装前按 [冲突策略](../guides/selection-and-conflicts.md) 处理已有渠道；`auto` 模式由 agent 自行保留/合并/跳过，不反复提问。
