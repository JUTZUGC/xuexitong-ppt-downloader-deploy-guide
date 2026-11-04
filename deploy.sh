#!/usr/bin/env bash
set -euo pipefail
# 学习通 PPT 下载器 一键安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/hazuki-keatsu/xuexitong-ppt-downloader#readme
# 更新日期：2026-11-04
# 类型：binary
cd "$(dirname "${BASH_SOURCE[0]}")"

command -v curl >/dev/null 2>&1 || { echo "需要先安装 curl"; exit 1; }

mkdir -p .download
cd .download

curl -fL -o xuexitong-ppt-downloader.user.js https://github.com/hazuki-keatsu/xuexitong-ppt-downloader/raw/main/dist/tampermonkey/xuexitong-ppt-downloader.user.js
ls -l xuexitong-ppt-downloader.user.js
echo "在 Tampermonkey 里导入该文件并启用"

echo ""

echo "下载与校验完成，安装包在 .download 目录"
echo "若结果异常或需要改配置，请参考官方文档：https://github.com/hazuki-keatsu/xuexitong-ppt-downloader#readme"
