#!/bin/bash
set -e

# 创建挂载目录（幂等，已存在不会报错）
mkdir -p ./gitea
mkdir -p ./jenkins_home
mkdir -p ./registry_data
mkdir -p ./workspace

# 构建 build_agent_asdf 镜像（幂等，已有同名镜像会被覆盖）
docker build -t build_agent_asdf:latest -f Dockerfile .

echo "所有挂载目录已准备，build_agent_asdf 镜像已构建。"
echo "你现在可以执行：docker compose up -d"