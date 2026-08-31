# CLI 升级维护

工具 ID：`cli-upgrade`。各 CLI 的安装和升级渠道见 [AI tools](../ai-tools/README.md)。此页仅负责维护脚本与可选定时执行。

选择本项或全选时，agent 可生成手动升级脚本；**定时启用是独立偏好**，未明确选择时不创建 launchd 任务。`auto` 冲突策略下允许采用下述保守默认值，无需逐项再问。

## 手动脚本与可选定时任务

仓库不分发全量升级安装器。选择本工具时，agent 按本机**已安装且本次允许维护**的组件生成手动升级脚本，默认路径可采用 `~/.local/bin/upgrade-cli-tools.sh`；只生成，不为了验收执行真实升级。默认维护范围是本次所选的可维护 CLI，不包含黑名单或未选的其他全局包。严格白名单只选择本脚本时，没有明确目标就生成带空目标列表和说明的安全脚本，不擅自纳入所有已装工具。

只有额外选择定时维护才生成并注册 `~/Library/LaunchAgents/local.oh-my-new-mac.upgrade-cli-tools.plist`。已有同类脚本/任务先核验身份，不能重复创建；auto 模式能无损合并则备份后更新，不能合并则保留原任务并跳过新调度。安装/更新命令从各单工具页及本机渠道确定，不维护第二份容易过期的包名表。

生成脚本应满足：

1. 逐个组件运行，记录起止时间、渠道、版本、退出码；某个失败不挡其他项目，但最后任一失败应返回非零。不要用无条件成功掩盖失败。
2. 不在无人值守环境执行会要求登录、确认、sudo 或付费的命令。遇到交互更新器跳过并记录，不猜测 `--yes` 参数；也不把 stdin 关闭等同于非交互支持。
3. 使用已确认渠道的绝对二进制路径，或经审阅的最小 PATH。launchd 不自动加载交互式 `.zshrc`。nvm 场景明确选择 Node 版本/alias，并在每次运行解析它；不要复制旧机器的固定版本路径，也不要 source 整份用户 zshrc。
4. 日志写入仅当前用户可访问的位置，目录先创建，日志不包含令牌。默认可保留最近 2000 行，但必须用临时文件+原子替换处理；保持失败记录可见。
5. 防止手动执行与定时执行同时升级；使用原子锁并记录拥有者，识别过期锁，不盲删锁。超时只终止本次启动的子进程，不按命令名杀全机进程。
6. 修改正在执行的维护脚本时用新文件原子替换，不能截断原文件。变更前备份，变更后语法检查。
7. 不自动升级 Node 本身，不改变 release channel，不顺带卸载重复安装。

可以从 [plist 示例](../../templates/upgrade-cli-tools.plist.example) 生成配置。所有 `__...__` 标记必须替换：Label、用户名无关的脚本绝对路径、日志绝对路径、用户选择的时间。plist 不展开 `~` 或 `$HOME`；必须用 XML 安全的编码/序列化器处理特殊字符。示例 **09:53 只是继承附件的例子，不是默认选择**。

## launchd 操作与验收

下面假定 agent 已生成并验证上面的默认 label 和文件；若本机名称不同，替换为实际值。

```sh
plutil -lint "$HOME/Library/LaunchAgents/local.oh-my-new-mac.upgrade-cli-tools.plist"
launchctl bootstrap "gui/$(id -u)" "$HOME/Library/LaunchAgents/local.oh-my-new-mac.upgrade-cli-tools.plist"
launchctl print "gui/$(id -u)/local.oh-my-new-mac.upgrade-cli-tools"
```

`bootstrap` 前检查 `print`，已加载则不要重复注册。修改计划需要先 `bootout` 精确 label 再重新加载；检查非零退出码，不隐藏其他错误。

```sh
launchctl bootout "gui/$(id -u)/local.oh-my-new-mac.upgrade-cli-tools"
```

这会停用该任务。手动触发真实升级（只在用户允许时）：`launchctl kickstart "gui/$(id -u)/local.oh-my-new-mac.upgrade-cli-tools"`。本机没有 GUI launchd domain 时，不猜 root/system 替代方案；给出当前会话限制。

先用不升级软件的测试任务验证日志和调度上下文，再在授权范围内验证真实更新命令；“plist 可解析”“已加载”与“定时实际升级成功”分别记录。

Apple 对 `StartCalendarInterval` 的说明是：睡眠错过的任务可在唤醒后运行，关机错过的任务不会以相同行为补跑；不要依赖精确的唤醒秒数，也不要为了升级改变电源设置。[Apple Scheduling Timed Jobs](https://developer.apple.com/library/archive/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/ScheduledJobs.html)

冲突与权限采用 [共享规则](../guides/selection-and-conflicts.md)。仅选择全选/auto 不等于授权定时、真实升级或修改未选的 Node 版本。
