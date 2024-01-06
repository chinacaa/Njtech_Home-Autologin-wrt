#!/bin/bash

curl --location --interface wan 'http://10.50.255.12:801/eportal/portal/login?callback=dr1003&login_method=1&user_account=%2C0%2C000000000000%40cmcc&user_password=00000000&wlan_user_ip=10.1.1.1&wlan_user_ipv6=&wlan_user_mac=000000000000&wlan_ac_ip=&wlan_ac_name=&jsVersion=4.1.3&terminal_type=1&lang=zh-cn&v=4580&lang=zh' \
  -H 'Accept: */*' \
  -H 'Accept-Language: zh-CN,zh;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6' \
  -H 'Connection: keep-alive' \
  -H 'DNT: 1' \
  -H 'Referer: http://10.50.255.12/' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0' \
  --compressed \
  --insecure
