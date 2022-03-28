#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
LANG=en_US.UTF-8

df -H
# 启动软件
Folder_A="/etc/rc.d/init.d"
for file_a in ${Folder_A}/*; do
    temp_file=$(basename $file_a)
    if [ "$temp_file" != "README" ]; then
        ${Folder_A}/$temp_file stop
        ${Folder_A}/$temp_file start
    fi
done

if [ -f "/setting.sh" ]; then
    bash /setting.sh "${BTName}" "${BTPassWord}" "${BTport}" "${BTPath}" | tee -a /setting.log
    rm -rf /setting.sh
    echo "${BTPassWord}" >"/www/server/panel/default.pl"
    /usr/bin/bt 1
fi

/usr/bin/bt 14
# 持续运行
tail -f /dev/null
