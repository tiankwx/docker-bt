## 介绍  

宝塔面板(bt.cn)在龙晰操作系统(Anolis)上的安装;   
兼容CentOS；   

---



##  根据需要安装软件
- 命令：bash install_soft.sh 1 install nginx 1.20
- 说明：1->急速安装 0->编译安装 install->安装 nginx->要安装的软件 1.2->要安装的软件版本号

```
cd /www/server/panel/install
bash install_soft.sh 1 install nginx 1.20
```
---

## 启动
```
docker run -p 443:443,80:80 -d tiankwx/anolis_bt.cn:v0.1
docker run -P --name="BT790" -d tiankwx/anolis_bt.cn:v0.1
docker run -dit --privileged=true --name="BT790" tiankwx/anolis_bt.cn:v0.1
# BTport使用时，必须在放开端口
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
