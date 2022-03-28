# 宝塔面板在龙晰系统上的安装
# tiankwx@outlook.com
# 2022-03-27
FROM openanolis/anolisos:8.4-x86_64

ENV BTName='gadmin' BTPassWord='gadmin' BTPath='gadmin' BTport='9999'

# 装载设置脚本
ADD setting.sh /setting.sh
RUN chmod a+x /setting.sh 
# 装载启动脚本
ADD start.sh /start.sh
RUN chmod a+x /start.sh
# 将宝塔路径暴露成卷
VOLUME /www/backup/database /www/backup/site /www/wwwlogs /www/wwwroot /www/server/data /www/server/panel/data

EXPOSE 8888 888 9999 80 22 21 443 8443 8080 3306
CMD ["/start.sh"]