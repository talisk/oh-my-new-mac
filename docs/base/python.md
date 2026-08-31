# Python 默认环境

工具 ID：`python`。原项目：[python/cpython](https://github.com/python/cpython)。本项表示配置可用的 Python 解释器与默认入口，不代表无条件再装第三份 Python。

## 推荐组合

新机器选择 Python 套件时建议 [pyenv](pyenv.md) 管解释器、[uv](uv.md) 建虚拟环境和管理项目依赖。解释器由一个管理者拥有，uv 默认复用它。完整套件涉及三个明确工具 ID：`python`、`pyenv`、`uv`；严格白名单若只包含 python，不能擅自安装未列入的管理器，应先复用已有渠道或报告依赖缺口。

已有 pyenv、conda、Brew Python 或 uv 管理解释器且满足需求时默认复用；用户选择迁移或给了自动冲突策略后，按保留旧环境、建立新入口的方案处理，不卸载原环境。

## 默认版本与项目隔离

优先项目 `requires-python`/`.python-version`，其次已有受支持且满足所选 CLI 的版本，新环境才解析当前稳定版本。global 是用户默认，不是改系统 Python。不要把“统一”理解为覆盖 `/usr/bin` 或修改所有项目的版本文件。

选择 pyenv + uv 后，在临时目录中通过明确解释器创建环境：

```sh
uv venv --python "$(pyenv which python)" .venv
.venv/bin/python -c 'import sys; print(sys.executable); print(sys.base_prefix)'
```

只在不存在 `.venv` 的测试目录执行，不覆盖现有虚拟环境。uv 的自动下载与偏好详见 uv 文档。

## 验证

分别记录系统 Python、管理器选中的 Python、当前 shell 入口、测试 venv 的 base_prefix。版本相同不代表来源相同；按实际路径证明复用。不要运行 `sudo pip install`、破坏 externally-managed Python 或迁走已有 venv。

核验：2026-08-31。共通选择与冲突规则见 [执行策略](../guides/selection-and-conflicts.md)。
