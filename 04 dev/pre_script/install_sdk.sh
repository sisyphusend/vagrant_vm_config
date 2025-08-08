#!/bin/bash

# 确保 asdf 已经在环境变量中
if ! command -v asdf >/dev/null 2>&1; then
  echo "请先安装并配置好 asdf"
  exit 1
fi

# 插件列表
plugins=(java maven gradle python poetry golang rust nodejs bun)

# 添加插件
for plugin in "${plugins[@]}"; do
  if ! asdf plugin list | grep -q "^$plugin$"; then
    asdf plugin add $plugin
  fi
done

# 安装最新版本
asdf install java temurin-21.0.7+6.0.LTS
asdf install java temurin-17.0.15+6
asdf install java temurin-11.0.27+6
asdf install java temurin-8.0.452+9

asdf install maven 3.9.9
asdf install gradle 8.14

apt-get install -y \
      libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev \
      wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev \
      libffi-dev liblzma-dev python3-openssl

asdf install python 3.11.13
asdf install python 3.12.11
asdf install python 3.13.5

asdf install poetry 2.1.3

asdf install golang 1.24.4

asdf install rust 1.87.0

asdf install nodejs 24.2.0
asdf install nodejs 22.16.0
asdf install nodejs 16.20.0

asdf install bun 1.2.17


# 设置全局默认版本
asdf set -u java temurin-21.0.7+6.0.LTS
asdf set -u maven 3.9.9
asdf set -u gradle 8.14
asdf set -u python 3.12.11
asdf set -u poetry 2.1.3
asdf set -u golang 1.24.4
asdf set -u rust 1.87.0
asdf set -u nodejs 24.2.0
asdf set -u bun 1.2.17 