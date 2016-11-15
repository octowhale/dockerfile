#!/bin/bash
#
# /root/entrypoint.sh


env >> /etc/profile
env > /root/env.cfg

sed -i 's/^/export /' /root/env.cfg

yum -y install wget

cd /root
wget -c https://raw.githubusercontent.com/octowhale/dockerfile/master/c7-arukas-ss/start.sh

/root/start.sh
