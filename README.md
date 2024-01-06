# Njtech_Home-Autologin-wrt
基于Shell脚本实现Openwrt上的Njtech_Home自动登录。
A relaunched project for autologin Njtech_Home, based on Openwrt shell.

特色：兼容多接口登录，可以与负载均衡搭配使用。
使用方法：
1 修改logincurl.sh，把“user_account=%2C0%2C000000000000%40cmcc”“user_password=00000000”修改为你自己的学号、运营商、密码；
2 把两个脚本上传到路由器中，推荐路径：/usr/autologin/ ；
3 给与两个文件足够的权限；
4 向 /etc/rc.local 添加以下命令来实现开机自动登录：
    bash /usr/autologin/autologin.sh
5 你也可以设置crontab来实现定时登录。

What's special: can run on multiple interfaces, work with load balance.
How to use:
1 Modify logincurl.sh to change "user_account=%2C0%2C000000000000%40cmcc" "user_password=0000000000" Change it to your own student number, operator, and password;
2 Upload two files into your router, commonly recommend /usr/autologin/ ;
3 Give full permissions to two files;
4 Add below to /etc/rc.local to execute autologin every startup:
    bash /usr/autologin/autologin.sh
5 Also can set crontab.
