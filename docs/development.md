# 基础开发环境

以下命令是 agent 按需求选择的配置方法，不是要求整段执行的安装脚本。执行前按 [工作流](workflow.md) 盘点、确认计划和备份。

## Apple 开发工具与架构

用 `xcode-select -p` 判断 Command Line Tools 是否可用；需要编译且未安装时执行 `xcode-select --install`，由用户完成系统安装界面。安装后验证 `xcrun --find clang`、`git --version`。只有 Apple 原生开发需求才建议完整 Xcode，并让用户从 Apple 官方渠道选择所需版本；不自动接受许可、切换 developer directory 或装 Rosetta。

Apple 工具没有等同于完整产品的 GitHub 安装项目，以 [Apple 安装说明](https://developer.apple.com/documentation/xcode/installing-the-command-line-tools/) 为依据。源码开放部分不能代替官方二进制安装渠道。

Apple Silicon 原生终端通常使用 `/opt/homebrew`，Intel 通常使用 `/usr/local`；以架构、`brew --prefix` 和现有 PATH 为准，不按用户名或旧机器路径推导。

## Homebrew

原项目：[Homebrew/brew](https://github.com/Homebrew/brew)，安装器：[Homebrew/install](https://github.com/Homebrew/install)，[安装要求](https://docs.brew.sh/Installation)。

缺失且用户选择后，从上游安装器下载、检查并运行（参照工作流的本地审阅步骤）。官方命令形态是：

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

不要直接把这一行当作免审阅的一键装机。安装完成按安装器给出的 `brew shellenv` 指令配置实际 shell 入口；在 zsh 新登录会话里确认 `command -v brew` 和 `brew --prefix`。

已安装时不重装，不自动 `brew link --overwrite`，不混用 arm64 与 x86_64 prefix。`brew doctor` 的警告逐项解释，不为了消掉警告执行破坏性清理。

## Git

原项目：[git/git](https://github.com/git/git)，[macOS 官方安装建议](https://git-scm.com/downloads/mac)。系统已有的 Apple Git 通常可以先保留；用户需要 Homebrew Git 时安装 `brew install git`，再次验证 PATH 和版本。

仅当需要配置提交身份时询问姓名、邮箱及使用仓库局部还是全局作用域。不要复制本仓库作者的身份，也不要擅自创建/覆盖 SSH key、修改签名设置或登录远程服务。

## Node.js：已有管理器优先，缺失时建议 nvm

原项目：[nvm-sh/nvm](https://github.com/nvm-sh/nvm)、[nodejs/node](https://github.com/nodejs/node)。npm 随 Node 分发，不要求另装第二套 Node。

先检查 `command -v node`、`node --version`、`npm prefix -g` 和已有初始化。存在 fnm/mise/其他管理器时保留它，按其原项目文档完成缺失配置；只有用户选择迁移才引入 nvm。

首次安装 nvm 时，从上游 README 指向的正式 tag 下载 `install.sh`；核验日 README 使用 `v0.40.7`，未来运行应重新确认，不能把这个版本当作永久最新。官方支持 `PROFILE=/dev/null` 防止安装器自行修改 profile，然后由 agent 合并一次初始化：

```zsh
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
```

如果现有 `NVM_DIR` 不在这里，保持原值。不要覆盖既有加载方式。按项目 `.nvmrc` 或用户选择安装版本；没有项目约束时建议 LTS：

```zsh
nvm install --lts
```

是否改变 `nvm alias default` 要与用户确认；安装新版本可能同时改变当前 shell 的 Node，必须验证并记录。全局 npm 包随 Node 版本目录变化；AI CLI 升级任务不能写死旧机器的 `~/.nvm/versions/node/v.../bin`。

## Python：已有环境优先，缺失时建议 uv

原项目：[astral-sh/uv](https://github.com/astral-sh/uv)、[python/cpython](https://github.com/python/cpython)。安装方法：[uv installation](https://docs.astral.sh/uv/getting-started/installation/)，[管理 Python](https://docs.astral.sh/uv/guides/install-python/)。

缺失且选择 Homebrew 管理 uv 时：

```sh
brew install uv
uv --version
```

需要 Python 时，按项目和用户选择运行 `uv python install <版本>`；该尖括号项必须替换为已确认的版本，不可原样执行。无版本约束时可采用上游支持的 `uv python install`，但要报告实际安装版本，不能默默替换已有 `python`/`python3`。

项目隔离使用 `uv venv`；测试时只在临时目录建环境。已有 pyenv/conda/虚拟环境一律保留，不执行 `sudo pip install`，不改系统 Python，不以解决一个 CLI 为由升级所有 Python 环境。

## pipx（仅在需要 Python CLI 时）

原项目：[pypa/pipx](https://github.com/pypa/pipx)，[官方安装说明](https://pipx.pypa.io/stable/installation/)。radio-active 上游推荐 pipx，因此未安装它且选择 radio-active 时：

```sh
brew install pipx
pipx ensurepath
```

`ensurepath` 可能改 shell 配置，应在备份后执行并审查差异。现有 pipx/uv tool 安装的 Python CLI 优先保留原渠道，不把同一个命令重复装进多个工具环境。

## 可选 shell 增强

所有项都只在用户选择后启用；不装新的 shell 框架，不替换终端主题。

| 工具 | 原项目与安装 | 配置 |
|---|---|---|
| fd | [sharkdp/fd](https://github.com/sharkdp/fd)：`brew install fd` | 无必需配置；供 yazi 文件搜索使用 |
| fzf | [junegunn/fzf](https://github.com/junegunn/fzf)：`brew install fzf` | 所装版本支持时在 zsh 片段加入 `source <(fzf --zsh)`；先检查已有快捷键/框架集成 |
| zoxide | [ajeetdsouza/zoxide](https://github.com/ajeetdsouza/zoxide)：`brew install zoxide` | zsh 片段 `eval "$(zoxide init zsh)"`；保留已有 `z` 函数，不自动覆盖 |
| ripgrep | [BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep)：`brew install ripgrep` | 命令名 `rg`，默认不需要配置 |

安装后在新的交互式终端检查命令和初始化；仅在 agent 子进程里 source 成功，不能证明用户下一次打开终端也生效。
