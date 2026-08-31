# 用模板创建自己的 Mac 配置仓库

从 [oh-my-new-mac 模板](https://github.com/talisk/oh-my-new-mac) 选择 **Use this template → Create a new repository**，填写自己的 Owner、仓库名和可见性。一般只复制默认分支即可。模板即使为私有，也可供有读取权限的用户使用；这不会自动向其他人开放权限。[GitHub 官方说明](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template)

## 使用链路

1. 创建自己的仓库并 clone 到目标 Mac，保留 `.agents` 等隐藏目录和 skill 相对符号链接。不要只复制 docs。
2. 用 agent 打开自己的 checkout，按宿主要求信任工作区。
3. `/add-config <产品>` 收录自己需要的额外工具，也可以更新已有条目；具体检索、分类和写入规则见 [收录指南](adding-config.md)。
4. `/setup-mac` 确认要配置的范围、名单和冲突策略，安装所选项并验证。已有 Mac 同样先盘点再补缺。

例如先输入 `/add-config homebrew` 更新现有 Homebrew 指南，再运行 `/setup-mac` 选择本次需要的环境。收录配置和安装配置是两次独立动作，不会因为编辑文档就执行装机。不同 agent 的命令入口见 [兼容说明](agent-compatibility.md)。

## 副本属于你

副本有自己的历史和 remote，不会自动接收或回写模板后续改动。可修改 README 标题、工具文档与分类索引；保留所采用代码/文档所需的 [LICENSE](../../LICENSE)。需要参考上游更新时按差异选择合并内容，不强制重置自己的仓库。

两个 skill 都定位当前仓库，不将 `talisk/oh-my-new-mac` 作为写入或推送默认值。工具 ID、既有状态目录和加载标记不因仓库改名就全局替换，以免重复安装或丢失旧任务。

用户偏好/通用配置方法可写进自己的工具页；机器盘点、日志、备份、实际账户资料仍放 `.local/` 或其他已忽略的本机位置，不进入模板或公开 Git 历史。

## GitHub Template 设置

Template 是 GitHub 仓库设置，不是放一个配置文件就能生效。有管理员权限的维护者可在 Settings → General 勾选 **Template repository**，保存后核验选中状态。新生成的副本若也需要作为模板分发，应单独检查它自己的设置，不能假定上游设置已复制。[GitHub 官方说明](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-template-repository)

启用模板不要求公开仓库；是否开放给所有 GitHub 用户是另一个可见性决定，不随本工作流自动更改。
