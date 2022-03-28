#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
LANG=en_US.UTF-8

# 在线安装
yum install -y wget
wget -O /install.sh http://download.bt.cn/install/install_6.0.sh
chmod a+x /install.sh
echo "y" | sh /install.sh
rm -rf /install.sh

# 修改登陆名
if [ -n "$1" ]; then
    echo $1 | /usr/bin/bt 6
else
    echo 'gadmin' | /usr/bin/bt 6
fi
# 修改登陆密码
if [ -n "$2" ]; then
    echo $2 | /usr/bin/bt 5
    echo $2 >"/www/server/panel/default.pl"
else
    echo 'gadmin' | /usr/bin/bt 5
    echo 'gadmin' >"/www/server/panel/default.pl"
fi
# 修改面板端口
if [ -n "$3" ]; then
    echo $3 | /usr/bin/bt 8
else
    echo '9999' | /usr/bin/bt 8
fi
# 修改面板安全入口
if [ -n "$4" ]; then
    echo /$4 >"/www/server/panel/data/admin_path.pl"
else
    echo "/gadmin" >"/www/server/panel/data/admin_path.pl"
fi
# 开户监控，并保存365天
echo "365" >/www/server/panel/data/control.conf
# 状态检测
/usr/sbin/crond -i # 启动cron
echo "*/1 * * * *  /usr/bin/wget -O /dev/null https://isipv6.herokuapp.com/api/getip >> /tmp/getIP.log 2>&1\n" >/var/spool/cron/root

yum -y update
yum -y upgrade
yum -y autoremove
yum clean all
