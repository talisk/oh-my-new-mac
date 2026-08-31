# PicGo Core：命令行图床

工具 ID：`picgo`。

原项目：[PicGo/PicGo-Core](https://github.com/PicGo/PicGo-Core)，[官方命令指南](https://docs.picgo.app/core/guide/commands)。这是 CLI，不是 PicGo Electron 桌面应用。安装 `npm install -g picgo`；验证 `picgo --help`。

```sh
picgo use uploader
picgo set uploader
```

先由用户选择图床，再通过官方交互配置凭据，通常存储在 `~/.picgo/config.json`（自定义 `-c` 时以实际为准）。不要打印完整配置或把它复制进 Git。插件另行核验其原 GitHub 项目和权限，不默认安装附件里提到的所有提供方插件。

上传示例 `picgo u ./shot.png` 会发送文件到远程；无参数可能读取剪贴板，二者均不能当作安装验证。HTTP server、Cloud sync 等不是新机默认组件，需要时检查实际版本 help、鉴权与监听范围。升级沿原 npm 渠道 `npm install -g picgo@latest`。

核验：2026-08-31。安装前按 [冲突策略](../guides/selection-and-conflicts.md) 处理已有渠道；`auto` 模式由 agent 自行保留/合并/跳过，不反复提问。
