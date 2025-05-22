FROM debian:bookworm-slim

# 环境变量
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai

# 设置时区，避免时间不一致
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone

# 安装基础依赖
RUN apt-get update && apt-get install -y \
    curl git unzip zip tar bash ca-certificates \
    openssh-server sudo gnupg lsb-release locales tzdata \
    && rm -rf /var/lib/apt/lists/*

# 设置语言
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
    && locale-gen

# 设置 SSH
RUN mkdir /var/run/sshd
RUN echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
RUN echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config

# 安装 ASDF 到 root
WORKDIR /root
RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.15.0 \
    && echo '. "$HOME/.asdf/asdf.sh"' >> ~/.bashrc \
    && echo '. "$HOME/.asdf/completions/asdf.bash"' >> ~/.bashrc

EXPOSE 22

# 保持容器运行
CMD ["/usr/sbin/sshd", "-D"]