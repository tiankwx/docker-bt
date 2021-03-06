# 自用，勿扰

## 介绍  

宝塔面板(bt.cn)在龙晰操作系统(Anolis 8.4-x86_64)上的安装;

兼容CentOS；   

默认信息：

```
ENV BTName='gadmin' BTPassWord='gadmin' BTPath='gadmin' BTport='9999'

VOLUME /www/backup/database /www/backup/site /www/wwwlogs /www/wwwroot /www/server/data /www/server/panel/data

EXPOSE 8888 888 9999 80 22 21 443 8443 8080 3306

==================================================================
BT-Panel default info!
==================================================================
外网面板地址: http://171.14.62.15:9999/gadmin
内网面板地址: http://172.17.0.2:9999/gadmin
*以下仅为初始默认账户密码，若无法登录请执行bt命令重置账户/密码登录
username: gadmin
password: gadmin
If you cannot access the panel,
release the following panel port [9999] in the security group
若无法访问面板，请检查防火墙/安全组是否有放行面板[9999]端口
==================================================================
```

---

## Docker hub

https://hub.docker.com/r/tiankwx/anolis_bt.cn


##  根据需要安装软件
- 命令：bash install_soft.sh 1 install nginx 1.20
- 说明：1->急速安装 0->编译安装 install->安装 nginx->要安装的软件 1.2->要安装的软件版本号

```
cd /www/server/panel/install
bash install_soft.sh 1 install nginx 1.20
```
---

## 启动例子，注意保存数据
```
docker run -p 443:443,80:80 -d tiankwx/anolis_bt.cn:v0.1

docker run -P --name="BT790" -d tiankwx/anolis_bt.cn:v0.1

docker run -dit --privileged=true --name="BT790" tiankwx/anolis_bt.cn:v0.1

# BTport使用时要放开端口
docker run -p 8888:9999 -d -e "BTName=name" -e "BTPassWord=password" -e "BTPath=path" -e "BTport=9999" tiankwx/anolis_bt.cn:v0.1

docker run -dit \
-p 80:80 \
-p 443:443 \
-p 8443:8443 \
-p 9999:9999 \
-v /宿主机自定义目录/wwwroot:/www/wwwroot \
-v /宿主机自定义目录/mysql:/www/server/data \
--privileged=true \
--name="BT790" \
tiankwx/anolis_bt.cn:v0.1

```

---
