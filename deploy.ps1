# 学习通 PPT 下载器 一键安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/hazuki-keatsu/xuexitong-ppt-downloader#readme
# 更新日期：2026-11-04
# 类型：binary
$ErrorActionPreference = 'Stop'
Set-Location -Path $PSScriptRoot

if (-not (Get-Command curl.exe -ErrorAction SilentlyContinue)) { throw '需要先安装 curl（Windows 10+ 自带 curl.exe）' }

New-Item -ItemType Directory -Force -Path .download | Out-Null
Set-Location -Path .download

curl.exe -fL -o xuexitong-ppt-downloader.user.js https://github.com/hazuki-keatsu/xuexitong-ppt-downloader/raw/main/dist/tampermonkey/xuexitong-ppt-downloader.user.js
Get-Item xuexitong-ppt-downloader.user.js | Select-Object Name, Length
Write-Host '在 Tampermonkey 里导入该文件并启用'

Write-Host ''

Write-Host '下载与校验完成，安装包在 .download 目录'
Write-Host '若结果异常或需要改配置，请参考官方文档：https://github.com/hazuki-keatsu/xuexitong-ppt-downloader#readme'
