#!/bin/bash
set -e

echo "🚀 蓝绿部署脚本"
echo "版本: $1"

VERSION=$1
if [ -z "$VERSION" ]; then
  echo "请指定版本号"
  exit 1
fi

echo "部署版本 $VERSION 到生产环境..."
docker pull ghcr.io/5czhongkai/auto-deployment:$VERSION

# 检测当前环境
if docker ps | grep -q "auto-deployment-blue"; then
  TARGET="green"
  TARGET_PORT=8081
else
  TARGET="blue"
  TARGET_PORT=8080
fi

echo "目标环境: $TARGET (端口: $TARGET_PORT)"

# 部署到目标环境
docker run -d \
  --name auto-deployment-$TARGET \
  -p $TARGET_PORT:8080 \
  ghcr.io/5czhongkai/auto-deployment:$VERSION

# 健康检查
sleep 10
curl -f http://localhost:$TARGET_PORT/health || exit 1

# 切换流量
echo "切换流量到 $TARGET..."
# 更新 Nginx 配置

echo "✅ 部署完成"
