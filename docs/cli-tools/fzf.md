# fzf：交互式模糊选择

工具 ID：`fzf`。原项目：[junegunn/fzf](https://github.com/junegunn/fzf)。安装 `brew install fzf`；基本选择器不需要 shell 初始化。

```sh
fzf --version
printf 'alpha\nbeta\n' | fzf --filter alpha
```

所选配置范围包含 shell 集成时，当前上游 zsh 方法为：

```zsh
source <(fzf --zsh)
```

只在支持 `--zsh` 的版本中使用，并放入唯一管理块；旧版按对应包提供的脚本处理。该集成增加补全与 Ctrl-R/Ctrl-T/Alt-C 等按键，先检查现有绑定，不同时加载框架插件和上述脚本。

`ask` 模式发现自定义按键冲突时询问；`auto` 保留已有绑定、跳过冲突集成，但仍安装/验证 fzf 二进制。无冲突且用户选择完整配置时可加入集成，不另设全局主题或强制替换 `FZF_DEFAULT_COMMAND`。Brew 渠道更新 `brew upgrade fzf`。

核验日期：2026-08-31。执行时重新核验当前官方说明；已有环境按 [选择与冲突规则](../guides/selection-and-conflicts.md) 处理。
