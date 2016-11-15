#!/usr/bin/env python
# encoding: utf-8

"""
@version: 01
@author: 
@license: Apache Licence 
@python_version: python_x86 2.7.11
@site: octowahle@github
@software: PyCharm Community Edition
@file: python_arukas_api.py
@time: 2016/11/14 12:18
"""


import base64

import json

import os, sys
import qrcode



def gen_ss_qrcode(f):
    s = open(f).read()

    data = json.loads(s)
    mapping_data = data["data"]["attributes"]["port_mappings"][0][0]
    service_port = mapping_data["service_port"]
    service_host = mapping_data["host"]

    # service_method = "aes-256-cfb"
    # service_password = "BgdD0wR2"
    
    print "service_host: %s" % service_host
    print "service_port: %s" % service_port
    
    
    service_method = os.getenv('SS_METHOD')
    service_password = os.getenv('SS_PASSWD')
    
    # print os.getenv('SS_PASSWD')
    print "service_method: %s " % service_method
    print "service_password: %s " % service_password
    
    
    uri = "%s:%s@%s:%s " % (service_method, service_password, service_host, service_port)

    # print uri
    # print "uri: %s" % uri

    s_base64 = base64.b64encode(uri).rstrip('=')
    # print s_base64

    ss_url = "ss://" + s_base64

    # print "<img src=%s></img>" % ss_url
    
    
    print ss_url
    
    qr = qrcode.QRCode(
        version=1,
        error_correction=qrcode.constants.ERROR_CORRECT_L,
        box_size=5,
        border=4,
    )
    qr.add_data(ss_url)
    
    qr.make(fit=True)
    img = qr.make_image()
    
    qrcode_name=os.path.join('/root',"pictname2.png")
    img.save(qrcode_name)

    # print '<img src="%s/pictname2.png">'

if __name__ == "__main__":
    # json_test(arukas_resp)

    service_method = os.getenv('SS_METHOD')
    service_password = os.getenv('SS_PASSED')

    f = os.path.join('/root', "s.txt")
    gen_ss_qrcode(f)
