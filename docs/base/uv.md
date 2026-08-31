# uv：配合 pyenv，而非重复管理同一解释器

工具 ID：`uv`。原项目：[astral-sh/uv](https://github.com/astral-sh/uv)；[安装](https://docs.astral.sh/uv/getting-started/installation/)、[Python 发现规则](https://docs.astral.sh/uv/concepts/python-versions/)、[环境变量](https://docs.astral.sh/uv/reference/environment/)。

## 安装

缺失且选择 Brew 渠道时 `brew install uv`，验证 `uv --version`。已有官方独立安装器或其他渠道时保留原渠道，不再装第二份。

## pyenv + uv 配置

uv 所谓 system Python 包括 pyenv 管理的 Python，不仅是 macOS 自带解释器。两者共同选中时，推荐在已审阅的 shell 片段合并：

```zsh
export UV_PYTHON_PREFERENCE=only-system
export UV_PYTHON_DOWNLOADS=never
```

这是**本仓库的组合策略**，不是 uv 的上游默认值；先记录已有值，只有选择该组合或自动冲突策略允许时写入。它防止 uv 默默下载第二套解释器，缺版本时让 agent 先用 pyenv 安装。若用户原有项目依赖 uv-managed Python，默认保留原全局设置，仅对本次项目命令按需传入这些环境变量，不破坏旧工作流。

在临时目录测试：`uv venv --python "$(pyenv which python)" .venv`，检查 `.venv/bin/python` 的 `sys.base_prefix` 确实指向所选 pyenv 版本。不要同时执行 `uv python install` 与 `pyenv install` 安装同一个版本。

## 其他模式与验证

仅选择 uv、未选择 pyenv 时复用可用解释器；是否允许 uv 下载 Python 由依赖策略和用户范围决定，不强制补装 pyenv。严格白名单/黑名单不允许所需解释器时，跳过依赖它的工具并记录。

Brew 安装的 uv 用 `brew upgrade uv`；独立安装器的更新按其官方说明，不混用。验证安装、解释器来源、临时 venv 分开报告；不把测试 venv 提交 Git。

核验：2026-08-31。共通选择与冲突规则见 [执行策略](../guides/selection-and-conflicts.md)。
