#!/bin/bash
set -e

# 配置 Docker 使用 HTTP 访问私有仓库（幂等）
DOCKER_CONFIG='/etc/docker/daemon.json'
REGISTRY="192.168.56.11:5000"
if [ -f "$DOCKER_CONFIG" ]; then
    if grep -q "$REGISTRY" "$DOCKER_CONFIG"; then
        echo "Docker 已配置 $REGISTRY 为不安全仓库。"
    else
        TMP=$(mktemp)
        jq --arg reg "$REGISTRY" '
            .["insecure-registries"] = (.["insecure-registries"] // []) + [$reg]
        ' "$DOCKER_CONFIG" > "$TMP" && mv "$TMP" "$DOCKER_CONFIG"
        echo "已将 $REGISTRY 添加为不安全仓库。"
        sudo systemctl restart docker
    fi
else
    echo "{\"insecure-registries\": [\"$REGISTRY\"]}" | tee "$DOCKER_CONFIG"
    echo "已创建 $DOCKER_CONFIG 并添加 $REGISTRY 为不安全仓库。"
    sudo systemctl restart docker
fi