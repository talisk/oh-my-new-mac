# Amphetamine

工具 ID：`amphetamine`。官方分发：[Mac App Store 的 Amphetamine](https://apps.apple.com/us/app/amphetamine/id937984704)，App ID `937984704`。本体未确认公开 GitHub 实现仓库；[Amphetamine-Enhancer](https://github.com/x74353/Amphetamine-Enhancer) 是可选辅助组件，不能代替本体，也不自动安装。

## 安装与配置

通过上述 Mac App Store 页面安装。核验时不存在 Homebrew `amphetamine` cask，不能生成 `brew install --cask amphetamine`。优先由宿主支持的 App Store UI 能力完成可自动执行的步骤；遇到 Apple ID 登录、密码、协议或系统审批时交还系统/用户处理。不要为了这一项暗中安装额外商店 CLI。

已有 App 先核对身份/版本；保留触发规则、会话和偏好。新装不启用常驻唤醒、登录启动或辅助增强程序。与 [Caffeine](caffeine.md) 并存时保留原本的主动会话，不同时开启两套新规则。

## 验证与冲突

检查 App 身份、版本及可打开状态，不以修改全机电源策略为验收。`auto` 模式不反复询问配置偏好，但不能替用户输入密码或接受新协议；需要用户才能完成时标为“待用户操作”并继续其他组件，不能报告已安装。

核验日期：2026-08-31。执行时重新核验当前官方说明；已有环境按 [选择与冲突规则](../guides/selection-and-conflicts.md) 处理。
