# 实用脚本

这是该分类的可选条目清单。每个文件负责一个工具/App；全选本分类会展开所有条目，但仍遵守黑名单与 [冲突策略](../guides/selection-and-conflicts.md)。

| 工具 ID | 工具 / 安装说明 | 可识别别名 | 范围与注意事项 |
|---|---|---|---|
| `rm-async` | [异步删除](rm-async.md) | rm_async、rm_progress | 多路径、任务 ID、真实状态；安装不授权删除 |
| `cli-upgrade` | [CLI 升级维护](cli-upgrade.md) | upgrade-cli-tools | 按本机生成手动脚本；定时运行独立选择 |

`rm-async` 的源码在 [utilities/rm-async](../../utilities/rm-async/)，不是装机脚本。CLI 升级脚本由 agent 依据本机渠道生成，不提供全机安装入口；定时任务不随全选自动启用。

返回 [总目录](../README.md)。
