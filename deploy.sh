#!/bin/bash

# 确保脚本在错误时退出
set -e

# 定义颜色
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# 定义服务器信息
SERVER_USER="root"
SERVER_IP="60.204.139.33"
SERVER_PATH="/opt/valorant"
GIT_REPO="git@github.com:ggaris/valorant.git"


# 2. SSH 到服务器并更新代码
echo -e "${GREEN}正在服务器上更新代码...${NC}"
ssh ${SERVER_USER}@${SERVER_IP} << EOF
    # 如果项目目录不存在，则克隆仓库
    if [ ! -d "${SERVER_PATH}" ]; then
        git clone ${GIT_REPO} ${SERVER_PATH}
    fi

    # 进入项目目录
    cd ${SERVER_PATH}

    # 拉取最新的更改
    git pull origin main

    # 确保 build_and_run.sh 是可执行的
    chmod +x build_and_run.sh

    # 运行 build_and_run.sh 脚本
    ./build_and_run.sh
EOF

echo -e "${GREEN}部署完成！${NC}"