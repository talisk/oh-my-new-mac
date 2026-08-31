# 基础环境

这是该分类的可选条目清单。每个文件负责一个工具/App；全选本分类会展开所有条目，但仍遵守黑名单与 [冲突策略](../guides/selection-and-conflicts.md)。

| 工具 ID | 工具 / 安装说明 | 可识别别名 | 范围与注意事项 |
|---|---|---|---|
| `apple-clt` | [Apple Command Line Tools](apple-clt.md) | CLT、Apple 开发工具 | Apple 安装器；已有完整 Xcode 保留 |
| `homebrew` | [Homebrew](homebrew.md) | brew | 包管理器；识别架构、已有 prefix |
| `git` | [Git](git.md) | git | Apple Git 可用就保留；身份不猜测 |
| `nvm` | [nvm](nvm.md) | Node Version Manager | 管理 Node；与已有 fnm/mise 协调 |
| `node` | [Node.js / npm](node.md) | node、npm | 默认入口统一；核对 system/nvm 数字版本 |
| `pyenv` | [pyenv](pyenv.md) | pyenv | 推荐解释器管理器；不替换系统 Python |
| `python` | [Python](python.md) | python、python3 | 解释器目标；由已有渠道或 pyenv 满足 |
| `uv` | [uv](uv.md) | uv | 项目环境/依赖；与 pyenv 共用解释器 |
| `pipx` | [pipx](pipx.md) | pipx | 隔离 Python CLI；如 radio-active |

推荐新机组合：`apple-clt + homebrew + git + nvm + node + pyenv + python + uv`；pipx 按 Python CLI 需求选择。选择“基础环境全选”则包括 pipx。解释器条目是配置目标，不要求再装第二份同版本运行时。

安装顺序按依赖决定：开发工具 → 包管理器 → 版本管理器 → 解释器 → 工具与 shell 集成。已有环境可满足目标就复用；白名单只写 node/python 不代表自动授权增装所有管理器。

返回 [总目录](../README.md)。
