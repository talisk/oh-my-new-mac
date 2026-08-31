# Caffeine

工具 ID：`caffeine`。同名 App 存在不同发行方；安装前必须确认身份，不能只比较 App 名称或版本数字。

| 发行方 | 原项目/官方入口 | 安装渠道与识别 |
|---|---|---|
| IntelliScape | [IntelliScape/caffeine](https://github.com/IntelliScape/caffeine)，[官网](https://intelliscapesolutions.com/apps/caffeine) | [Brew caffeine](https://formulae.brew.sh/cask/caffeine)，bundle `com.intelliscapesolutions.caffeine` |
| Domzilla 发行版 | [caffeine-app.net](https://www.caffeine-app.net/)；未确认公开实现仓库 | 官网发行包，bundle `net.domzilla.caffeine`；不是上面的 Brew 包 |

## 安装与配置

新机没有既有偏好时，可选择来源可追溯的 IntelliScape 分支：

```sh
brew install --cask caffeine
```

若现有的是 Domzilla 版，保持该版及其官方更新渠道，不通过 Brew 覆盖同名 Caffeine.app，也不把两家的版本号用于升降级判断。用户指定发行方时以指定为准；来源不明确按冲突策略处理。

安装后默认不启用“开机启动”或永久保持唤醒。菜单栏开关、持续时间等由用户需求决定，保留已有设置。全选包含 [Amphetamine](amphetamine.md) 时可并存安装，但不自动启用两个防休眠会话。

## 验证与冲突

核对 bundle/版本/来源；GUI 检查菜单项，不以持续阻止休眠作为验收。`auto` 模式保留已有可信发行版，新机不猜用户希望永久唤醒；同名冲突无法安全区分则跳过新装，并给出建议。

核验日期：2026-08-31。执行时重新核验当前官方说明；已有环境按 [选择与冲突规则](../guides/selection-and-conflicts.md) 处理。
