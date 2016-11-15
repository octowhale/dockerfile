#!/bin/bash

# /bin/cat > /root/env.cfg <<EOF
# /bin/bash

# export SS_PORT=$SS_PORT
# export SS_PASSWD=$SS_PASSWD
# export SS_METHOD=$SS_METHOD
# export ARU_ACCESS_TOKEN=$ARU_ACCESS_TOKEN
# export ARU_SECRET_TOKEN=$ARU_SECRET_TOKEN
# export ARU_CONTAINER_ID=$ARU_CONTAINER_ID
# export MAIL_FROM=$MAIL_FROM
# export MAIL_PWD=$MAIL_PWD
# export MAIL_SMTP=$MAIL_SMTP
# export MAIL_TO=$MAIL_TO


# EOF


# /bin/cat >> /etc/profile <<EOF
# /bin/bash

# export SS_PORT=$SS_PORT
# export SS_PASSWD=$SS_PASSWD
# export SS_METHOD=$SS_METHOD
# export ARU_ACCESS_TOKEN=$ARU_ACCESS_TOKEN
# export ARU_SECRET_TOKEN=$ARU_SECRET_TOKEN
# export ARU_CONTAINER_ID=$ARU_CONTAINER_ID
# export MAIL_FROM=$MAIL_FROM
# export MAIL_PWD=$MAIL_PWD
# export MAIL_SMTP=$MAIL_SMTP
# export MAIL_TO=$MAIL_TO


# EOF



source /etc/profile
source /root/env.cfg



# 启动 SSD
# Set up AUTHORIZED_KEY if you specify the one
if [ "$AUTHORIZED_KEY" != "none" ]; then
  mkdir -p /root/.ssh
  chmod 600 /root/.ssh
  touch /root/.ssh/authorized_keys
  chmod 600 /root/.ssh/authorized_keys
  echo "$AUTHORIZED_KEY" >> /root/.ssh/authorized_keys

  # Configure sshd.conf
  ## For pubkey authentication
  sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config
fi

if [ "$ROOT_PWD" == "default" ]; then
  ROOT_PWD="root"
fi
echo "root:$ROOT_PWD" | chpasswd

/usr/sbin/sshd -D &



cd /root

/bin/chmod +x *.py *.sh

[ ! -f /usr/bin/pip ] && /bin/bash /root/init_env.sh
[ ! -f /usr/bin/sendEmail ] && /bin/bash /root/init_env.sh


echo /root
# start shadowsocks
touch /root/ss.log && chmod 777 $_
/usr/bin/ssserver -k ${SS_PASSWD} -p ${SS_PORT} -m ${SS_METHOD}  --log-file /root/ss.log  -d start


sleep 20 
/root/mail_notice.sh &

tail -f /root/ss.log


