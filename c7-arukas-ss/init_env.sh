#!/bin/bash

source /etc/profile

yum -y install python curl curl-devel
# yum -y install httpd

curl -L https://bootstrap.pypa.io/get-pip.py  | python 
# curl -L http://192.168.31.222/get-pip.py  | python 



# pypi_server=pypi.douban.com
pypi_server=pypi.python.org



pip install --index-url=http://${pypi_server}/simple/ --trusted-host ${pypi_server} shadowsocks
pip install --index-url=http://${pypi_server}/simple/ --trusted-host ${pypi_server} qrcode
pip install --index-url=http://${pypi_server}/simple/ --trusted-host ${pypi_server} Image


yum -y install  wget perl 
wget http://caspian.dotconf.net/menu/Software/SendEmail/sendEmail-v1.56.tar.gz
 
tar zxf sendEmail-v1.56.tar.gz
mv sendEmail-v1.56/sendEmail /usr/bin/ 
rm -rf sendEmail-v1.56*


yum clean all

