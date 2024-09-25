#!/bin/bash

# 确保脚本在错误时退出
set -e

# 定义颜色
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# 1. 构建镜像
echo -e "${GREEN}开始构建 Docker 镜像...${NC}"
docker-compose build

# 2. 运行容器
echo -e "${GREEN}启动 Docker 容器...${NC}"
docker-compose up -d

# 3. 显示运行中的容器
echo -e "${GREEN}正在运行的容器:${NC}"
docker-compose ps

# 4. 显示日志
echo -e "${GREEN}显示容器日志...${NC}"
docker-compose logs -f