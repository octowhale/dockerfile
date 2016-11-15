#!/bin/bash
#
# 
# /root/start.sh



cd /root

source /etc/profile
source /root/env.cfg

wget -c https://raw.githubusercontent.com/octowhale/dockerfile/master/c7-arukas-ss/mail_notice.sh
wget -c https://raw.githubusercontent.com/octowhale/dockerfile/master/c7-arukas-ss/gen_qrcode.py
wget -c https://raw.githubusercontent.com/octowhale/dockerfile/master/c7-arukas-ss/init_env.sh
wget -c https://raw.githubusercontent.com/octowhale/dockerfile/master/c7-arukas-ss/start_service.sh


chmod +x *.sh *.py

/root/start_service.sh

