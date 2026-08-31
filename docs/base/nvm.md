# nvm

工具 ID：`nvm`。原项目：[nvm-sh/nvm](https://github.com/nvm-sh/nvm)。用途：用户级 Node 版本管理；具体版本与入口统一见 [Node.js](node.md)。

## 安装

检查 `command -v nvm`（nvm 是 shell 函数，不应只用 which）、`NVM_DIR` 和现有初始化。已有 nvm 继续使用原目录。已有 fnm/mise 等管理器时，按冲突策略处理；自动模式不让两套管理器同时争抢默认 PATH。

从上游 README 当前正式 tag 下载 `install.sh` 到 `.local/downloads/`，读脚本后执行 `PROFILE=/dev/null /bin/bash <已下载脚本路径>`。`PROFILE=/dev/null` 是上游支持的关闭自动 profile 编辑方式。核验时 README 使用 v0.40.7；执行时重新核验 tag，不把这个版本当作永久最新。不使用上游不支持的 Homebrew nvm 安装作为默认。

## 初始化

新配置可在唯一 zsh 片段中使用下面内容；已有 `NVM_DIR` 或初始化方式时保持原值并合并，不重复覆盖。

```zsh
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
```

将片段放在 Homebrew 初始化之后；不把某个 Node 版本目录写死到 PATH。nvm 初始化和默认 Node 选择是两件事，继续执行 node 文档，不只做到函数可用。

## 验证与冲突

新终端检查 `command -v nvm`、`nvm --version`、`nvm current`。安装 nvm 本身不自动迁走旧全局 npm 包。若用户选择自动解决，已有其他管理器且仍需保留其项目时，可安装 nvm 而不激活为默认，记录“已装/未接管默认”；不要默默卸载原管理器。

核验：2026-08-31。共通选择与冲突规则见 [执行策略](../guides/selection-and-conflicts.md)。
