#!/bin/bash
set -e

# 创建所需目录（幂等，已存在不会报错）
mkdir -p mysql/data mysql/conf.d pgsql/data redis

# 创建 MySQL 配置目录下的默认配置文件（如不存在）
if [ ! -f mysql/conf.d/my.cnf ]; then
  cat > mysql/conf.d/my.cnf <<EOF
[mysqld]
# 这里可以添加自定义配置
EOF
fi

# 创建 PostgreSQL 配置文件（如不存在）
if [ ! -f pgsql/postgresql.conf ]; then
  cat > pgsql/postgresql.conf <<EOF
listen_addresses = '*'
EOF
fi

# 创建 Redis 配置文件（如不存在）
if [ ! -f redis/redis.conf ]; then
  cat > redis/redis.conf <<EOF
# Redis 配置示例
bind 0.0.0.0
EOF
fi

echo "目录和配置文件已准备好。"
echo "运行: docker compose up -d"