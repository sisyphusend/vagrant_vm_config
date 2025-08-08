#### 目录含义
`00 common` 记录通用的信息，比如安装常用软件的 docker_compose.yml
`01 cicd` 我的cicd环境
`02 k8s` 我的k8s环境
`03 net_lab` 用于做网络实验的环境
`04 dev` 日常vscode或cusror远程代码开发的环境
`05 test` 用于实验和试用软件的环境
`06 desktop` 用于实验和试用软件的环境

#### vagrant管理虚拟机的特点
用户名:vagrant 密码:vagrant | 用户名:root 密码:vagrant, 都是用 host-only 网络，所有的虚拟机都在 192.168.56.01/24 这个网段
`vagrant provision` 这个命令可以在虚拟机启动后，执行shell脚本
带有GUI的虚拟机直接在用vmware创建，不用vagrant管理


#### vmware 虚拟机
esxi8 用户名:root 密码:root@2025


##### 04 dev 服务器
环境要求:
32GB 内存 300GB 硬盘空间 4 cpu 核心
docker
asdf
git
vim

目录要求：
external_service 对外部服务的组件(数据库等)
codefield  远程开发所有的代码
codefield/reference 用于参考的代码(来源他人的github)
codefield/study  用于学习的代码
codefield/myproject 用于写自己的项目代码
codefield/tmp 不重要，可以随时删除的

备份：
codefield 每周备份

转向使用 arch linux  直接在虚拟机中开发 (vscode 远程有问题)

等待 arch linux 搭建好了把 sdk 卸载掉


##### 06 desktop 桌面环境
arch linux:
用途：用来作为开发主力机
vagrant box add terrywang/archlinux --box-version 4.24.0529 --provider virtualbox






