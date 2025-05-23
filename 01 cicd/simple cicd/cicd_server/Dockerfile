FROM debian:bookworm-slim

# 设置时区，避免时间不一致
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone

# 设置 root 密码为 root
RUN echo 'root:root' | chpasswd

# 安装基础依赖（使用 apt 而不是 apk）
RUN apt-get update && apt-get install -y \
    openjdk-17-jre \
    curl \
    git \
    ca-certificates \
    openssh-server \
    bash \
    && rm -rf /var/lib/apt/lists/*

# 设置语言（Debian 方式）
RUN apt-get update && apt-get install -y locales && \
    echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen


# 设置 SSH
RUN mkdir -p /var/run/sshd && \
    echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config && \
    echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config && \
    ssh-keygen -A

# 安装 ASDF 到 root
WORKDIR /root
RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.15.0 \
    && echo '. "$HOME/.asdf/asdf.sh"' >> ~/.bashrc \
    && echo '. "$HOME/.asdf/completions/asdf.bash"' >> ~/.bashrc

EXPOSE 22

# 保持容器运行
CMD ["/usr/sbin/sshd", "-D"]