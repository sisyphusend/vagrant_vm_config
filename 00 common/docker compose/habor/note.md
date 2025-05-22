### 下载并解压
wget https://github.com/goharbor/harbor/releases/download/v2.12.0/harbor-offline-installer-v2.12.0.tgz
tar -zxvf harbor-offline-installer-v2.12.0.tgz
cd harbor
### 修改配置文件 把https 注释掉 修改  hostname 为 本机的ip地址
cp harbor.yml.tmpl harbor.yml

运行脚本
./prepare
./install
