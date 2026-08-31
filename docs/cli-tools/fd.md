# fd：文件名搜索

工具 ID：`fd`。原项目：[sharkdp/fd](https://github.com/sharkdp/fd)。安装 `brew install fd`；无需默认配置，可独立使用，也可供 yazi/fzf 集成。

```sh
fd --version
fd '\.md$' docs
```

第二行在本仓库内查找 Markdown 文件；默认遵循忽略规则，不是扫描主目录。需要隐藏文件等选项时查当前 help。不为安装 fd 替换系统 find 或加入同名 alias。

Brew 渠道更新 `brew upgrade fd`。已有 MacPorts/Cargo 等兼容安装时保留渠道；`auto` 下不重复安装来强制统一来源。

核验日期：2026-08-31。执行时重新核验当前官方说明；已有环境按 [选择与冲突规则](../guides/selection-and-conflicts.md) 处理。
