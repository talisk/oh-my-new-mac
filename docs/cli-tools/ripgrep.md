# ripgrep：代码搜索（命令名 rg）

工具 ID：`ripgrep`。

原项目：[BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep)。`brew install ripgrep`；验证 `rg --version` 和在临时文件中的搜索。无需默认配置。

| 命令 | 用法 |
|---|---|
| `rg -n foo src/` | 搜索并显式显示行号 |
| `rg -S foo` | 智能大小写：模式含大写时区分大小写 |
| `rg -F 'a.b'` | 按纯文本搜索 |
| `rg -g '*.ts' foo` | 只搜匹配路径 |
| `rg --files` | 列出符合忽略规则的文件 |
| `rg --hidden --no-ignore foo` | 同时搜索隐藏和被忽略文件，注意秘密和性能 |
| `rg foo -r bar` | 替换显示结果，**不修改文件** |

默认会考虑忽略规则；输出到管道时行号等呈现不同，脚本中显式指定所需选项。`rg --json` 是结构化输出，不要求额外安装 delta。Brew 渠道升级 `brew upgrade ripgrep`。


核验：2026-08-31。安装前按 [冲突策略](../guides/selection-and-conflicts.md) 处理已有渠道；`auto` 模式由 agent 自行保留/合并/跳过，不反复提问。
