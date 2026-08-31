# Node.js：统一系统来源、nvm 默认值与实际入口

工具 ID：`node`；包含其随附的 npm。原项目：[nodejs/node](https://github.com/nodejs/node)、[npm/cli](https://github.com/npm/cli)，版本切换依据：[nvm](https://github.com/nvm-sh/nvm)。macOS 不自带 Node；此处“系统 Node”是 **nvm 之外**由 Brew、官方 pkg 或其他管理器提供的 Node。

## 目标与盘点

区分两个目标：已有系统 Node 与 nvm 使用**同一个完整版本号**；用户新终端、所选 GUI 的终端和维护任务使用**同一个默认入口**。只调整 PATH 并不等于两套二进制版本相同。

读取 `whence -a node npm`、`node --version`、`node -p process.execPath`、`npm prefix -g`、`nvm ls`、`nvm alias default`。查看项目提供的 `.nvmrc`/engines，但不扫描和改写全部项目。读取 `.npmrc` 时只检查是否存在 prefix 等冲突键，禁止打印认证令牌。

在已加载 nvm 的一次性子 shell 内探测系统 Node，避免改变用户当前会话：

```zsh
(
  nvm use system >/dev/null 2>&1 || exit 1
  command -v node
  node --version
)
```

失败表示没有可用的 nvm 外部 Node，不是安装失败。

## 统一规则

1. 用户/项目指定版本优先，其次选择满足全部所选 CLI engines 的已有受支持版本；没有合适版本时选择当前官方受支持 LTS，解析到确切版本后记录。不能把 latest 当作永远兼容。
2. **已有系统版本可用、没有更强约束**：直接把它作为目标，`nvm install <完整版本>`、`nvm alias default <完整版本>`、`nvm use <完整版本>`。这样系统与 nvm 数字一致，且保留原系统安装。尖括号必须用盘点结果替换。
3. **只有 nvm 或两者都缺失**：由 nvm 安装目标并设 default；不为凑“两套一致”另装 Brew Node。报告“系统 Node 不存在；默认入口已统一”。
4. **已有系统 Node 过旧且所选工具不支持**：安装合适的 nvm 版本并作为所选工具入口，保留旧系统 Node 给原有依赖；报告“入口已统一，但旧系统版本保留，版本未完全统一”。不要谎称全部相同。`ask` 模式可询问是否沿原渠道升级系统 Node；`auto` 模式优先保留，不 force link/覆盖全局文件。
5. **用户明确要求两套精确一致且不能保留旧版本**：只有原渠道能安全提供所需精确版本并已获对应迁移授权时更新；Brew 大版本 formula 不保证相同 patch。无法兼容时标记部分完成，不用手工链接覆盖 Brew 管理的 node，不卸载依赖它的软件。
6. fnm/mise 等已有管理器优先保留其默认控制权；自动模式可以在 nvm 安装相同版本作备用，不并行加载两套切换 hook。默认值改变只作用于已选择的全局环境，不改项目 `.nvmrc`。

## PATH 与全局 CLI

修复顺序为：备份 → Homebrew 初始化 → 一个有效的 Node 管理器 → 检查后续 source 是否再次改变 PATH。不要加一个每次 prompt 都强制切 Node 的 hook，那会破坏项目版本切换。

nvm 不影响纯 `zsh -c`、launchd 或所有 GUI 环境。选定维护任务使用已确认 `nvm.sh` 加 `nvm exec <版本> ...` 或真实绝对 node 路径；不要 source 全部 zshrc。GUI 终端按其实际登录 shell 设置验证，不承诺改 zshrc 会改变所有系统进程。

变更 Node 后只重装本次允许的 npm CLI 到目标版本环境；保留旧版本及旧全局包，不用全量 `--reinstall-packages-from` 绕过白名单/黑名单。

## 验证

在新登录和非登录交互 zsh 中分别记录版本、execPath、npm prefix；如果有系统 Node，再用上面的子 shell 确认两套完整版本是否相同。最后逐个验证所选 npm CLI。报告明确列出“系统版本”“nvm default”“实际入口”“未统一项”。

核验：2026-08-31。共通选择与冲突规则见 [执行策略](../guides/selection-and-conflicts.md)。
