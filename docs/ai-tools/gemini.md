# Gemini CLI

工具 ID：`gemini`；别名：gemini-cli；命令：`gemini`。原项目：[google-gemini/gemini-cli](https://github.com/google-gemini/gemini-cli)，[官方配置文档](https://geminicli.com/docs/reference/configuration/)。

## 安装与配置

新装 `brew install gemini-cli`，或在所选 Node 环境下 `npm install -g @google/gemini-cli`。二选一；采用 npm 前核验当前 package engines，不能按旧文档固定 Node 版本。

首次运行 `gemini` 选择官方支持的认证方式，由用户登录。保留 `~/.gemini/settings.json`、项目设置与企业配置，不为接入本仓库清空个人命令或扩展。仓库内 `/setup-mac` 的入口不需要安装额外插件。

## 验证与维护

`gemini --version`、新 shell 生效路径和所选渠道。升级二选一：`brew upgrade gemini-cli` / `npm install -g @google/gemini-cli@latest`。

`auto` 下保留可用渠道并合并需要的项目入口；不重复安装另一套、不切换用户账号或默认计费项目。登录与实际模型调用未完成时分别报告。

核验日期：2026-08-31。执行时重新核验当前官方说明；已有环境按 [选择与冲突规则](../guides/selection-and-conflicts.md) 处理。
