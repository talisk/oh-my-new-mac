# surge：静态站点部署

工具 ID：`surge`。

原项目：[sintaxi/surge](https://github.com/sintaxi/surge)。确认当前 Node/npm 来源后安装 `npm install -g surge`，用 `surge --help` 验证。账号登录与发布分开处理，不能运行裸 `surge` 作为安装测试，因为它会进入发布流程。

```sh
surge login
surge list
```

这些命令仅在用户需要账号功能时运行。实际发布示例 `surge ./dist example.surge.sh`、下线 `surge teardown example.surge.sh` 都会修改远程状态，每次按用户明确请求处理。不要调用 `surge token` 并把令牌输出到报告。

域名、DNS 和 HTTPS 是部署配置，**不作为新机默认配置**。用户确需自定义域名时读取当前 [Surge 官方文档](https://surge.sh/help/) 和本机 help，确认域名、费用、DNS 与证书规则后另作计划。升级沿原 npm 来源运行 `npm install -g surge@latest`。


核验：2026-08-31。安装前按 [冲突策略](../guides/selection-and-conflicts.md) 处理已有渠道；`auto` 模式由 agent 自行保留/合并/跳过，不反复提问。
