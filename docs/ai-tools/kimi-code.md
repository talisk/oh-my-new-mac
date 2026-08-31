# Kimi Code

工具 ID：`kimi-code`；别名：Kimi；命令：`kimi`。原项目：[MoonshotAI/kimi-code](https://github.com/MoonshotAI/kimi-code)，[安装、认证与升级](https://moonshotai.github.io/kimi-code/en/guides/getting-started)。

## 安装与配置

新装使用官方 `https://code.kimi.com/kimi-code/install.sh`，先下载审阅后执行；这个渠道不要求先安装 Node。默认数据目录 `~/.kimi-code/`；保留用户自定义目录和已有设置，不输出凭据。启动 `kimi` 后 `/login` 由用户完成。

旧 [MoonshotAI/kimi-cli](https://github.com/MoonshotAI/kimi-cli) 是另一代 Python CLI，其 README 提示新安装器会迁移配置和会话。发现旧 `kimi-cli` 时不能直接把安装器当无副作用升级。先记录来源、迁移范围、会话备份及恢复方式。

## 验证与维护

用 `kimi --version`、命令来源及安装记录验证。当前原生渠道支持 `kimi upgrade`，但可能需要交互，不能默认塞进 launchd。确实由 npm 安装的新 Kimi Code 才使用 `npm install -g @moonshot-ai/kimi-code@latest`。

冲突默认询问；`auto` 下保留仍可用的旧 Kimi 环境并报告新版本未迁移。仅当官方迁移影响已核实、备份与恢复可验证且不改变用户身份/提供方时，才可在用户已选的自动修复范围内执行。不清空旧目录、不自动搬运秘密到仓库。

核验日期：2026-08-31。执行时重新核验当前官方说明；已有环境按 [选择与冲突规则](../guides/selection-and-conflicts.md) 处理。
