# glow：Markdown 阅读器

工具 ID：`glow`。

原项目：[charmbracelet/glow](https://github.com/charmbracelet/glow)。安装 `brew install glow`，验证 `glow --version` 和 `glow README.md`。

```sh
glow README.md
glow -p README.md
glow -s dark README.md
glow -w 80 README.md
```

直接 `glow` 打开 TUI；不承诺历史 stash 服务仍可用。没有必需配置，用户选择主题时才运行 `glow config` 或按上游配置说明修改。Brew 安装用 `brew upgrade glow` 维护。


核验：2026-08-31。安装前按 [冲突策略](../guides/selection-and-conflicts.md) 处理已有渠道；`auto` 模式由 agent 自行保留/合并/跳过，不反复提问。
