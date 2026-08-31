# 验证与交接标准

## 仓库本身

在仓库根目录执行：

```sh
zsh -n utilities/rm-async/functions.zsh
zsh -n utilities/rm-async/worker.zsh
python3 -m unittest discover -s tests -v
git diff --check
```

测试使用 Python 标准库、macOS 自带 zsh 和系统工具，不装额外依赖。测试目录在被忽略的 `.local/`；只删除测试自己创建的目标，不修改 HOME 或真实 shell 配置。非 macOS 会跳过运行测试，不能把跳过当作通过。

覆盖多目标/空格/末尾换行、符号链接、单目标 ID 兼容、无效参数整批预检、umask 保持、根目录/主目录/当前目录/状态目录保护、目标替换拒绝、暂停及 PID 复用识别。PTY 用例创建真实控制终端、后台提交并退出启动 shell，确认任务结束；这覆盖曾经出现的 queued 假进展问题。

还应检查所有相对文档链接、agent 入口符号链接、Gemini TOML、plist 示例和 skill frontmatter。若宿主提供 skill-creator 的验证器，可使用；本仓库不把它当成所有 agent 必装依赖。

## 每台机器的配置验收

| 层级 | 证据 | 不能据此宣称 |
|---|---|---|
| 源码/语法 | shell 语法、plist/TOML 可解析 | 实际已安装或可运行 |
| 安装 | 明确渠道安装退出码、包记录、版本 | 当前 PATH 一定使用这套版本 |
| shell | 新交互式/登录 shell 中的来源、版本和所选初始化 | TUI/认证/服务功能完整可用 |
| 实际功能 | 用户要求范围内的操作结果 | 未操作过的其他功能成功 |
| 认证 | 用户完成官方登录后的非敏感状态 | 账号一定有额度、Premium 或付费授权 |
| 定时维护 | 已加载任务、实际执行结果与日志 | 未来每次都准时成功 |

媒体播放、网页登录、GUI、发布、上传和收费请求不能为了验收而擅自触发。安装后尚未获得这类操作授权，就报告“CLI 安装/PATH 已验证，认证/播放/上传待用户完成”。

## 本次仓库交付的边界

2026-08-31 本机 macOS 验证：5 项 unittest 全部通过（包含真实 PTY），zsh 语法、skill-creator 校验、Gemini TOML、plist 示例、相对链接与入口链接均通过；两份原始附件按字节比对一致。

本次只创建仓库与文档，验证本仓库的实用脚本和静态入口；没有批量安装上述 CLI，没有修改当前机器的版本管理器、登录信息或定时任务，也没有在各家 agent 中执行整套真实装机流程。

源文档的核验依据见 [sources.md](sources.md)。公开来源未确认的 traex 保留为待核验项；Cursor GitHub 只作为官方入口，CLI 安装依据来自其官方文档。
