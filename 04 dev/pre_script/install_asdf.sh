#!/bin/bash

set -e

ASDF_VERSION="0.18.0"
ASDF_TAR="asdf-v${ASDF_VERSION}-linux-amd64.tar.gz"
ASDF_URL="https://github.com/asdf-vm/asdf/releases/download/v${ASDF_VERSION}/${ASDF_TAR}"
ASDF_DIR="/opt/asdf"
ASDF_BIN="${ASDF_DIR}/asdf"

# 检查 asdf 是否已存在
if [ -x "$ASDF_BIN" ]; then
  echo "asdf 已安装在 $ASDF_BIN"
else
  wget -q "$ASDF_URL" -O "$ASDF_TAR"
  tar -xzf "$ASDF_TAR"
  rm -f "$ASDF_TAR"
  sudo mkdir -p "$ASDF_DIR"
  sudo mv -f asdf "$ASDF_BIN"
  sudo chmod +x "$ASDF_BIN"
fi

# 幂等添加环境变量到 .bashrc
if ! grep -q 'export PATH=$PATH:/opt/asdf' ~/.bashrc; then
  echo 'export PATH=$PATH:/opt/asdf' >> ~/.bashrc
fi


# 幂等添加 asdf shims 目录到 PATH
if ! grep -q 'ASDF_DATA_DIR.*shims' ~/.bashrc; then
  echo 'export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"' >> ~/.bashrc
fi