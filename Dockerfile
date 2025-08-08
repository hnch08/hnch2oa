FROM debian:bullseye-slim

# 安装必要命令
RUN apt-get update && \
    apt-get install -y bash coreutils && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# 设置容器工作目录
WORKDIR /app

# 只复制 target 目录内容（必须配合 .dockerignore）
COPY target/o2server/ .

# 启动脚本赋权
RUN chmod +x start_linux.sh

EXPOSE 80 20020 20030

CMD ["bash", "./start_linux.sh"]
