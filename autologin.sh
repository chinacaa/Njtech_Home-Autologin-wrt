#!/bin/bash

cd $(dirname $0)

#收集接口信息
ifconfigout=$(ifconfig)
wans=$(echo $ifconfigout | grep -B1 "inet addr:10" | grep "Link encap" | awk '{print $1}')

#清除日志
echo "" -f >aoutologin.log

for wan in $wans; do
    #判断是否已登录
    if [ $(curl -i --location '10.50.255.12' | grep -c "<!--Dr.COMWebLoginID_1.htm-->") -ne 1 ]; then

        #文件锁逻辑
        if [ -f /tmp/lock/logincurl.lock ]; then
            echo "logincurl.sh is running" -f >aoutologin.log
            exit 11
        fi
        touch /tmp/lock/logincurl.lock
        #修改脚本信息
        awk '{sub("--interface ([^ ]+)", "--interface $wan", $0)}' logincurl.sh
        awk '{sub("wlan_user_ip=([0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3})", "wlan_user_ip=$(echo $ifconfigout | grep -A1 "$wan" | grep -o "inet addr:[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" | grep -o "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}")}' logincurl.sh
        #执行登录脚本
        bash logincurl.sh
        #文件锁解锁
        rm -f /tmp/lock/logincurl.lock

        #检查登录是否成功
        if [ $(curl -i --location '10.50.255.12' | grep -c "<!--Dr.COMWebLoginID_1.htm-->") -ne 1 ]; then
            echo "$wan fail" >aoutologin.log
        fi

    fi
done
