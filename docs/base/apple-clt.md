# Apple Command Line Tools

工具 ID：`apple-clt`。用途：编译器、SDK 与系统 Git 的基础支持。来源：[Apple 官方安装文档](https://developer.apple.com/documentation/xcode/installing-the-command-line-tools/)，没有将 GitHub 上的第三方下载器当作官方渠道。

## 安装与配置

先运行 `xcode-select -p`、`xcrun --find clang`。已可用则保留当前 developer directory；完整 Xcode 已提供相应工具时不重复安装。

缺失且属于本次选择/已授权依赖时执行 `xcode-select --install`，处理系统安装界面。安装通常需要系统权限或交互，不能通过关闭系统安全设置绕过。无需 Apple 原生开发时不安装完整 Xcode；需要完整 Xcode 时另外按 Apple 官方支持矩阵处理，不把几十 GB 下载作为全选工具清单的隐藏依赖。

## 验证与已有环境

检查 `xcrun --find clang`、`clang --version`、`git --version`。不要自动切换其他 Xcode、接受未知许可或安装 Rosetta。自动处理模式下保留可用工具链；系统审批无法完成时标记待用户完成并继续独立组件。

核验：2026-08-31。共通选择与冲突规则见 [执行策略](../guides/selection-and-conflicts.md)。
