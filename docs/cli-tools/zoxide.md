# zoxide：常用目录跳转

工具 ID：`zoxide`；默认 shell 入口：`z`、`zi`。原项目：[ajeetdsouza/zoxide](https://github.com/ajeetdsouza/zoxide)。安装 `brew install zoxide`。

完整配置采用当前上游 zsh 初始化：

```zsh
eval "$(zoxide init zsh)"
```

先检查已有 `z`/`zi` 函数、插件与初始化；同一套只加载一次。保留历史数据库，不导入整份其他工具历史。不把 `cd` alias 成 z，不改变用户原本导航习惯。

验证 `zoxide --version` 与新 shell 的 `whence -v z`。交互式 `zi` 需要 [fzf](fzf.md)；未选/排除 fzf 时保留 `z`，报告 `zi` 缺依赖，不自动扩展名单。

`auto` 下同名自定义入口优先保留，可只安装二进制，记录集成跳过；使用其他命令名只有在已核验上游参数且不会改变用户预期时才采用。Brew 渠道更新 `brew upgrade zoxide`。

核验日期：2026-08-31。执行时重新核验当前官方说明；已有环境按 [选择与冲突规则](../guides/selection-and-conflicts.md) 处理。
