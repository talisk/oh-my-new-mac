# 🤖 AI CLI 每日自动升级备忘

> claude · codex · kimi · grok · cursor-agent · traex · gemini

---

## 🗺️ 各 CLI 安装渠道

| CLI | 安装方式 | 证据路径 | 升级命令 |
|---|---|---|---|
| `claude` | Homebrew Cask | `/opt/homebrew/Caskroom/claude-code@latest/` | `brew upgrade --cask claude-code@latest` |
| `codex` | npm 全局 | `~/.nvm/.../node_modules/@openai/codex` | `npm i -g @openai/codex@latest` |
| `kimi` | 官方安装器 `~/.kimi-code` | 自带子命令 | `kimi upgrade` |
| `grok` | 官方安装器 `~/.grok`（版本目录） | 自带子命令 | `grok update` |
| `cursor-agent` | 官方安装器 `~/.local/share/cursor-agent/versions` | 自带子命令 | `cursor-agent update` |
| `traex` | 独立二进制 `~/.local/bin/traex` | 自带子命令 | `traex update` |
| `gemini` | Homebrew Formula | `/opt/homebrew/Cellar/gemini-cli/` | `brew upgrade gemini-cli` |

注意：`codex` 同时存在 brew cask 安装，但 PATH 生效的是 npm 版，脚本里两个都升级以防切 PATH 拿到旧版。

排查方法：`command -v <cmd>` 找到二进制位置，`readlink -f` 解析符号链接看真实安装目录。

---

## ⚙️ 升级脚本

位置：`~/.local/bin/upgrade-cli-tools.sh`（已 `chmod +x`）

| 行为 | 说明 |
|---|---|
| 逐个渠道升级 | 单个失败不影响其他工具（`set -u`，不用 `-e`） |
| PATH 预置 | nvm node / `~/.local/bin` / `~/.kimi-code/bin` / homebrew |
| 日志 | 追加到 `~/.local/log/upgrade-cli-tools.log`，自动截断到 2000 行 |
| 新增工具 | 在脚本里加一行 `run <名字> <升级命令>` 即可，定时任务无需改动 |

---

## ⏰ 定时任务（launchd）

plist：`~/Library/LaunchAgents/com.talisk.upgrade-cli-tools.plist`，每天 **09:53** 运行脚本。

| 命令 | 作用 |
|---|---|
| `launchctl list \| grep upgrade-cli-tools` | 确认任务已加载 |
| `launchctl unload ~/Library/LaunchAgents/com.talisk.upgrade-cli-tools.plist` | 停用 |
| `launchctl load ~/Library/LaunchAgents/com.talisk.upgrade-cli-tools.plist` | 启用 |
| 改时间 | 编辑 plist 里的 `Hour`/`Minute`，unload 再 load |
| launchd 自身日志 | `~/.local/log/upgrade-cli-tools.launchd.log` |

⚠️ macOS 睡眠错过的触发不会补跑；电脑关机那天就跳过，无需处理。

---

## 🛠️ 常用操作

| 命令 | 作用 |
|---|---|
| `~/.local/bin/upgrade-cli-tools.sh` | 立即手动全量升级 |
| `tail -50 ~/.local/log/upgrade-cli-tools.log` | 看最近升级结果 |
| `grep 'exit code' ~/.local/log/upgrade-cli-tools.log \| tail` | 只看各工具退出码 |
| `bash -n ~/.local/bin/upgrade-cli-tools.sh` | 改完脚本后语法检查 |

⚠️ 不要在脚本后台运行时编辑脚本文件——bash 边读边执行，中途改动会读到错位的字节。

---

*创建于 2026-07-29，与本仓库会话中实际排查结果一致*
