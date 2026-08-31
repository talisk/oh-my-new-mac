# Codex CLI

工具 ID：`codex`；别名：Codex CLI；命令：`codex`。原项目：[openai/codex](https://github.com/openai/codex)，[官方 CLI 文档](https://developers.openai.com/codex/cli/)。桌面应用另选 [Codex Desktop](../gui-apps/codex-desktop.md)。

## 安装与配置

新装二选一：

```sh
brew install --cask codex
# 已选 Node/npm 渠道时的另一种选择，不是第二步：
npm install -g @openai/codex
```

保留 `~/.codex/` 的既有配置、认证和项目指令，尊重自定义 `CODEX_HOME`。运行 `codex` 后通过官方流程登录。不要为了装机启用跳过审批的参数，也不要替用户设置模型、组织、API 地址或收费方案。

## 验证与维护

`codex --version`，新 shell 中的 `whence -a codex` 与当前包记录共同确定生效渠道。Brew 用 `brew upgrade --cask codex`；npm 用 `npm install -g @openai/codex@latest`，更新只针对所选的一套。

`auto` 模式遇到 npm/Brew 双装，保留当前兼容且来源可信的生效版本；必要的 PATH 修复只修改可回滚的初始化片段，不清理另一套。`codex` cask 是 CLI，不能用它冒充桌面应用安装结果。

核验日期：2026-08-31。执行时重新核验当前官方说明；已有环境按 [选择与冲突规则](../guides/selection-and-conflicts.md) 处理。
