#### 目录含义
`common` 记录通用的信息，比如安装常用软件的 docker_compose.yml
`cicd` 我的cicd环境
`k8s` 我的k8s环境
`net_lab` 用于做网络实验的环境
`dev` 日常开发依赖的组件的环境
`test` 用于实验和试用软件的环境

#### vagrant管理虚拟机的特点
用户名:vagrant 密码:vagrant | 用户名:root 密码:vagrant, 都是用 host-only 网络，所有的虚拟机都在 192.168.56.01/24 这个网段
`vagrant provision` 这个命令可以在虚拟机启动后，执行shell脚本
带有GUI的虚拟机直接在用vmware创建，不用vagrant管理


#### vmware 虚拟机
esxi8 用户名:root 密码:root@2025





