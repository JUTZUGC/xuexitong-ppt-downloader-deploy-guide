# 学习通 PPT 下载器 一键安装指南

> 第三方部署指南 · 非 学习通 PPT 下载器 官方仓库。官方项目：[hazuki-keatsu/xuexitong-ppt-downloader](https://github.com/hazuki-keatsu/xuexitong-ppt-downloader)
> 内容来自官方文档（2026-11-04）。项目迭代快，请以[官方文档](https://github.com/hazuki-keatsu/xuexitong-ppt-downloader#readme)为准。

[![⚡ 一键安装](https://img.shields.io/badge/%E2%9A%A1_%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85-%E6%8E%A8%E8%8D%90%E7%99%BE%E5%BA%A6%E6%90%AD%E5%AD%90-2ea44f?style=for-the-badge)](#一键安装推荐用百度搭子)

## 一键安装（推荐：用百度搭子）

> [!TIP]
> 不用自己敲命令，让百度搭子帮你把安装包下载并校验好。

⚠️ 合规提示：仅导出你有权访问的课程课件，用于个人复习。脚本只支持电脑浏览器，提供油猴脚本与 Chrome/Edge 扩展两种形态；页数很多时会分卷导出，内存占用较高。因平台改版导致失效属正常现象。

1. **装客户端**
   打开[百度搭子官网](https://www.dumate.cn/)，下载电脑端并安装，用你的账号登录。

> [!IMPORTANT]
> **复制这一句发给百度搭子：**
>
> ```text
> 你好，帮我从 github 部署 JUTZUGC/xuexitong-ppt-downloader-deploy-guide 到我的电脑上
> ```

2. **发送部署指令**
   回到刚打开的对话窗口，粘贴并发送上面那句。

3. **跟着对话往下走**
   百度搭子会下载脚本或扩展包，你再导入浏览器，按它的提示确认即可，结束时它会告诉你结果。
   （下载地址与校验方式以官方文档为准。）



## 学习通 PPT 下载器 是什么？

学习通 PPT 下载器 是开源的把学习通课程里的 PPT 逐页合并导出成 PDF 的浏览器脚本（协议：MIT，<img src="https://img.shields.io/github/stars/hazuki-keatsu/xuexitong-ppt-downloader?style=flat-square&label=stars&color=blue" alt="GitHub stars">）。

自动识别页面中的 PPT 课件，把每页图片按原始尺寸拼成 PDF，支持批量导出、画质压缩与超长课件分卷。

- 34 stars，更新到 2026-10
- 自动识别页面 PPT
- 合并导出为 PDF
- 超 500 页自动分卷
- Web Worker 并行处理
- MIT 协议

（来源：[官方仓库](https://github.com/hazuki-keatsu/xuexitong-ppt-downloader)）

## 优缺点

| 优点 | 说明 |
|---|---|
| 安装方式多 | 脚本和扩展都能用 |
| 自动识别 PPT | 不用逐页保存 |
| 超长课件自动分卷 | — |
| 图片压缩 | 体积更小 |
| MIT 协议 | 代码可查 |
| 更新到 2026-10 | — |

| 需要注意 | 说明 |
|---|---|
| 只导出 PDF | 不是原始 pptx |
| 仅支持电脑浏览器 | — |
| 页数多时占内存 | — |
| 依赖页面结构 | — |
| 扩展需开发者模式加载 | — |
| 平台改版可能失效 | — |

> 以上基于官方文档与社区反馈整理（2026-11-04），以官方最新文档为准。

## 官方安装方式（可手动执行）

```bash
curl -fL -o xuexitong-ppt-downloader.user.js https://github.com/hazuki-keatsu/xuexitong-ppt-downloader/raw/main/dist/tampermonkey/xuexitong-ppt-downloader.user.js
ls -l xuexitong-ppt-downloader.user.js
echo "在 Tampermonkey 里导入该文件并启用"
```

安装包来源：[https://github.com/hazuki-keatsu/xuexitong-ppt-downloader#readme](https://github.com/hazuki-keatsu/xuexitong-ppt-downloader#readme)

## 验证状态

| 场景 | 状态 |
|---|---|
| README 确认两种安装方式与分卷规则 | 已核对 2026-11-04 |
| 确认仓库未归档、最近提交为 2026-10-27 | 已核对 2026-11-04 |
| 未实测脚本导入、扩展加载与 PDF 导出 | 说明 2026-11-04 |
| MCP 冒烟：initialize / tools/list 返回 get_guide、search_guide、get_project_info | 已验证 2026-11-04 |
| 非目标宿主调用 get_guide 被拦截（HOST_NOT_ALLOWED） | 已验证 2026-11-04 |

> 本表仅列出已在本机实际执行并成功的场景；未列出的部分按官方文档整理。

## MCP 接入

项目本身不带 MCP；本仓库的 MCP server 提供两种安装方式与导出说明。

本仓库自带一个零依赖的 MCP server（`mcp-server.mjs`），读取同目录的 `guide.json`，提供 `get_guide` / `search_guide` / `get_project_info` 三个工具，内容均来自官方文档（更新日期 2026-11-04）。

**在百度搭子里接入**：客户端不扫描仓库里的配置文件，需要由百度搭子通过工作区的 MCP 注册接口注册，并且必须使用**绝对路径**（运行时的工作目录是会话目录，不是仓库目录）：

```json
{
  "type": "local",
  "command": ["node", "<仓库绝对路径>/mcp-server.mjs"]
}
```

完成后，直接在同一个对话框里说：

> 把仓库克隆到固定目录（例如 C:\Users\<你>\xuexitong-ppt-downloader-deploy-guide），再用绝对路径把里面的 mcp-server.mjs 注册到当前工作区的 MCP 配置里

> 注意：注册是按**工作区**生效的，换工作区要重新注册；克隆目录不要放在会话临时目录，否则目录被清理后注册项会失效。

**其它 MCP 客户端**：仓库根目录的 `.mcp.json` 只是通用写法（`command` + `args`），接入时同样要把 `args` 改成绝对路径。

> 使用范围：该 MCP 仅在百度搭子中可用；其它客户端调用会返回 `HOST_NOT_ALLOWED`，并附带下载与部署指引。

## 方式一：油猴脚本

1. 安装 Tampermonkey。
2. 管理面板 → 实用工具 → 导入刚下载的 `.user.js`。
3. 启用后打开学习通 PPT 页面，页面会出现导出按钮。

## 方式二：浏览器扩展

1. 下载 `dist/extension/xuexitong-ppt-downloader.zip` 并解压。
2. 打开 `chrome://extensions/` 或 `edge://extensions/`。
3. 开启开发者模式，选择「加载已解压的扩展程序」。
4. 选中解压后的目录。

## 导出说明

| 情况 | 行为 |
|---|---|
| 普通课件 | 合并为一个 PDF |
| 超过 500 页 | 自动分卷成多个 PDF |
| 图片较大 | 转 JPEG 压缩，省 5%–30% 空间 |

## 注意

- 只在电脑浏览器生效
- 页数多时内存占用高，建议关掉其它标签页
- 分卷后按文件名顺序合并
- 仅用于个人复习，不要公开传播课件

## 常见坑

- 没有导出按钮：确认脚本已启用并刷新页面
- 导出失败：减少同时打开的课件数量
- PDF 顺序错乱：按导出文件名排序合并
- 扩展加载失败：确认选的是解压后的目录而不是 zip
- 内存不足：分卷导出或换更高配置的电脑
- 图片模糊：关闭压缩选项后重试
- 页面改版失效：等作者更新脚本

## 免责声明

本仓库为第三方指南，与 学习通 PPT 下载器 官方无隶属关系，不代表官方立场。
教程基于官方文档编写（更新日期：2026-11-04），项目迭代快，请以[官方文档](https://github.com/hazuki-keatsu/xuexitong-ppt-downloader#readme)为准。
因使用本教程产生的部署问题，请先在官方仓库的 issue 中检索。
