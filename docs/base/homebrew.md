# Homebrew

工具 ID：`homebrew`；别名 `brew`。原项目：[Homebrew/brew](https://github.com/Homebrew/brew)，安装器：[Homebrew/install](https://github.com/Homebrew/install)，[安装要求](https://docs.brew.sh/Installation)。

## 检查现状

`command -v brew`、`brew --prefix`、`brew config`；同时检查本机存在的 `/opt/homebrew/bin/brew`、`/usr/local/bin/brew`。Apple Silicon 原生和 Rosetta 的两套 prefix 可以共存，不按路径猜用户想使用哪套。以当前 shell 架构、已有包和项目依赖决定。

## 安装

缺失时，agent 从 `https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh` 下载脚本到本仓库 `.local/downloads/`，读文件确认写入范围与官方来源，再用 `/bin/bash` 运行这份文件。不要审查后又下载另一份执行。官方示例为 `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`，本仓库采用先落盘审阅的等价流程。

安装器可能触发 [CLT](apple-clt.md) 或 sudo；先纳入依赖计划。黑名单禁止 Brew 或 CLT 时，不通过安装器间接绕过。

## shellenv 与保留策略

使用安装器给出的真实 `brew shellenv` 路径。常见 arm64 zsh 登录初始化为 `eval "$(/opt/homebrew/bin/brew shellenv)"`，Intel 常见路径为 `/usr/local/bin/brew`；仅在本机证据匹配时采用。

先识别 `ZDOTDIR`、现有 source 和初始化顺序，向实际 `.zprofile` 合并一次标记块；需要交互非登录终端时使用现有公共片段，不盲目追加两份。Homebrew 初始化在 nvm/pyenv 之前，避免后来又把 Brew Node 放到优先位置。

## 升级与验证

`brew update` 更新包索引；不等于授权升级所有软件。用新登录及非登录交互 shell 验证 `brew --prefix` 和命令可用性。自动处理模式保留已有可用 prefix；不执行 `brew link --overwrite`、`brew cleanup` 或卸载另一架构环境。

核验：2026-08-31。共通选择与冲突规则见 [执行策略](../guides/selection-and-conflicts.md)。
