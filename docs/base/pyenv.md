# pyenv

工具 ID：`pyenv`。原项目：[pyenv/pyenv](https://github.com/pyenv/pyenv)。pyenv 管 CPython 版本，虚拟环境和包交给 [uv](uv.md)；不默认再装 pyenv-virtualenv。

## 安装和 shell

已存在时读取 `pyenv root`、`pyenv versions` 和已有加载块。缺失时按 macOS 上游方式 `brew install pyenv`；Brew 被排除且没有其他已核验安装渠道时，不绕过名单。

在实际 zsh 入口合并一次官方初始化：

```zsh
export PYENV_ROOT="$HOME/.pyenv"
[[ -d "$PYENV_ROOT/bin" ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
```

已使用非默认 `PYENV_ROOT` 时保留它。pyenv shims 放在一般系统路径之前；已有 conda/其他管理器需要按冲突策略处理，不能让两个自动激活块争抢。非交互登录 shell 需要时按上游文档扩展到 zprofile，不照搬到每个入口重复执行。

## 安装解释器

先读上游 [Suggested build environment](https://github.com/pyenv/pyenv/wiki#suggested-build-environment)，按本机架构和目标 Python 确认编译依赖；CLT 和 Homebrew 库必须进入依赖清单，不能带着黑名单直接运行一串 brew install。

2026-08-31 上游 macOS 构建环境示例为：

```sh
brew install openssl@3 readline sqlite3 xz tcl-tk@8 libb2 zstd zlib pkgconfig
```

这是构建依赖示例，不是无条件全装指令：先核验目标 Python 的需求和本机已有库，再把实际缺项纳入允许依赖。上游特别提示不同 Python 版本对 OpenSSL、Tcl/Tk 的兼容性有差异；不能自行把 `openssl@3` 换成新主版本，或忽略黑名单运行整行。

`pyenv install --list` 查看可安装版本，选项目约束内的稳定版本。用 `pyenv install -s <完整版本>` 安装，首次新环境可 `pyenv global <完整版本>`。这些占位符都须替换，不能固定为文档生成日的“最新版本”。已有全局版本可用时保留，不改项目 `.python-version`。

## 验证与共存

检查 `pyenv version`、`pyenv which python`、`python --version`；在临时环境测试 `ssl`、`sqlite3`、`bz2`、`lzma` 导入，避免只编译成功但缺模块。然后按 [Python](python.md) 与 uv 集成。

自动模式优先复用已有 Python；若新增 pyenv 会与旧管理器冲突，可安装但不夺取默认值，明确记录。不要删除 `/usr/bin/python3`、Brew Python、旧 pyenv 版本或 conda 环境。

核验：2026-08-31。共通选择与冲突规则见 [执行策略](../guides/selection-and-conflicts.md)。
