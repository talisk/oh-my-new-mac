# pipx

工具 ID：`pipx`。原项目：[pypa/pipx](https://github.com/pypa/pipx)，[官方安装](https://pipx.pypa.io/stable/installation/)。用途：隔离安装 Python CLI，radio-active 上游推荐此方式。

缺失且 Brew 被允许时 `brew install pipx`。`pipx ensurepath` 会修改 shell 配置，先备份并查看已有 `~/.local/bin` 等入口；已可用时不重复改写。验证 `pipx --version`、`pipx list`。

已有 uv tool/pipx 环境优先按原渠道维护，不把相同 Python CLI 复制安装。Brew pipx 可能依赖 Brew Python，这个解释器属于包管理器内部依赖，不要为了 pyenv 默认环境把它卸载；但严格依赖排除仍须在安装前检查。

维护工具本身用原渠道；包用 `pipx upgrade <已选择包>`，不全局 `upgrade-all`。自动模式保留已有 PATH 和 Python 环境，不清空 venv。

核验：2026-08-31。共通选择与冲突规则见 [执行策略](../guides/selection-and-conflicts.md)。
