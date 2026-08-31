# Pi coding agent

工具 ID：`pi`；命令：`pi`。当前原项目：[earendil-works/pi](https://github.com/earendil-works/pi/tree/main/packages/coding-agent)。旧 `badlogic/pi-mono` 项目入口已重定向；不能继续假定旧 npm 包名就是当前新装方法。

## 安装与配置

核验时上游 quick start 使用：

```sh
npm install -g --ignore-scripts @earendil-works/pi-coding-agent
```

`--ignore-scripts` 来自上游建议。当前 [package.json](https://github.com/earendil-works/pi/blob/main/packages/coding-agent/package.json) 要求 Node `>=22.19.0`；实际执行时重新读取 engines，再选择满足项目约束的受支持 Node。若 Node 被排除或版本不足，按依赖/冲突策略处理，不暗中升级所有 Node 环境。

也有 [pi.dev](https://pi.dev/) 官方安装渠道；采用时先核验当期说明，不与 npm 双装。启动 `pi` 后通过 `/login` 选择账户；保留用户/项目 `.pi` 配置、扩展和已有提供方。不自动安装第三方扩展。

## 验证与维护

`pi --version`，核对命令路径、npm prefix 与实际 package 名称。npm 渠道维护使用同一确认过的包：`npm install -g --ignore-scripts @earendil-works/pi-coding-agent@latest`。

`auto` 下发现旧包，保留兼容可用版本。需要迁移时先检查两个包的 `pi` 命令冲突与官方迁移说明；不能为了 npm 安装成功而强制覆盖旧链接。无法无损迁移则记录跳过，继续其他工具。

核验日期：2026-08-31。执行时重新核验当前官方说明；已有环境按 [选择与冲突规则](../guides/selection-and-conflicts.md) 处理。
