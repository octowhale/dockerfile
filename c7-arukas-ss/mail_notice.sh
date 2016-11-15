#!/bin/bash

# sendemail


source /etc/profile
source /root/env.cfg

cd /root

sleep 120

# get server infomation
/bin/curl -s  -u ${ARU_ACCESS_TOKEN}:${ARU_SECRET_TOKEN} https://app.arukas.io  -n https://app.arukas.io/api/containers/${ARU_CONTAINER_ID}  -H "Content-Type: application/vnd.api+json"    -H "Accept: application/vnd.api+json" |/bin/grep ${ARU_CONTAINER_ID}  > /root/s.txt

# gen server qrcode
# chmod +x /root/gen_qrcode.py
/usr/bin/python /root/gen_qrcode.py > /root/mail_content.txt


# notice

export MAIL_TO=$(echo $MAIL_TO |sed "s/:/ -t /g")
/usr/bin/sendEmail -f $MAIL_FROM -s $MAIL_SMTP -o username=$MAIL_FROM -o password=$MAIL_PWD -t $MAIL_TO -u "$(date +%F): ss qrcode" -o message-content-type=auto -o message-file=/root/mail_content.txt -a /root/pictname2.png

cat /root/mail_content.txt

