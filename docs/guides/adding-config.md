# 收录一个配置条目

在自己的仓库中调用 `/add-config <产品>`，agent 会检索官方来源、更新或新建文档并维护分类索引。核心入口是 [add-config skill](../../.agents/skills/add-config/SKILL.md)，文档结构参考其 [单工具模板](../../.agents/skills/add-config/assets/tool-entry.md)。这一步不安装产品。

## 分类与粒度

| 分类目录 | 收录内容 | 判断例子 |
|---|---|---|
| `docs/base/` | 包管理器、开发工具链、语言解释器及其管理器 | Homebrew、nvm、Python、uv |
| `docs/ai-tools/` | 以终端/agent 工作流为主的 AI 工具 | Codex CLI、Pi、OpenCode |
| `docs/scripts/` | 独立实用脚本、仓库自有函数、按本机生成的维护工具 | rm-async、CLI 升级维护 |
| `docs/cli-tools/` | 其他通用终端工具 | ripgrep、yazi、PicGo Core |
| `docs/gui-apps/` | 主要通过 macOS App 使用的产品，包括 AI 桌面产品 | Cursor Desktop、终端 App |

一个独立工具/App 一个文件；App 自带的辅助命令一般留在该 App 文档，独立分发的 CLI 与 Desktop 则按实际请求分别收录。不要因为 GUI 产品含 AI 功能就复制到 ai-tools。新依赖若已收录就链接原条目，避免各页重复维护它的安装方法。

稳定 ID 与文件名一致，如 `homebrew` 对应 `docs/base/homebrew.md`。同一产品的别名 `brew` 不新建条目；同名不同产品必须按官方身份区分。更新现有文档时保留用户的安装渠道、版本约束和笔记，说明推荐与旧方案的差异。

## 需要收集的内容

记录产品用途、官方 GitHub 与文档、支持的平台/架构、真实包名/命令、必要/可选依赖、安装和初始化、配置位置、基本用法、保留旧环境的方法、验证与维护/回滚。每项可执行方法应有对应官方依据和核验日期；安装不代表账号/真实功能已验证。

没有公开源码的产品可以收录，但要说明来源类型。未核验的命令不猜测补齐；身份明确而证据不全时标“待核验”，索引注明“不执行”，setup-mac 完成核验前不能安装。网页推荐的插件不自动成为目录新条目或安装依赖。

按 [来源核验方法](sources.md) 检索，按 [选择与冲突规则](selection-and-conflicts.md) 写出 ask/auto 分支，保持已有环境兼容性。不会为收录信息运行安装脚本、读取认证文件或触发发布/删除操作。

## 典型结果

- `/add-config homebrew`：刷新既有 `docs/base/homebrew.md` 的官方方法与基本使用，保留工具 ID 和分类行，不增加重复文件。
- `/add-config <一个尚未收录的明确 CLI>`：新建一个 cli-tools 文件，并加入该分类 README；setup-mac 下次读取清单即可看到它。
- `/add-config Cursor Desktop`：只更新 GUI 条目，不顺带添加或安装 Cursor CLI。
- 产品名有歧义：提出具体问题或按用户不询问偏好暂缓该项，不能随机装入一个同名项目。

这些是行为示例，不要求 agent 在维护本 skill 时顺便执行。修改副本内容不自动同步上游；提交前检查当前 remote。详见 [模板使用](template.md)。
