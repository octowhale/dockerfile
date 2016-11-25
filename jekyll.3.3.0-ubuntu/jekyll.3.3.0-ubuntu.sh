#!/bin/bash


curl -L http://mirrors.163.com/.help/sources.list.wily > /etc/apt/sources.list
sed -i 's/wily/xenial/' /etc/apt/sources.list


apt-get -y update
for i in $(dpkg -l |grep ruby |awk '{print $2}'); do dpkg --purge $i ; done ;

apt-get -y install ruby2.3 ruby2.3-dev ruby-ffi

gem sources --remove http://rubygems.org/
gem sources --remove https://rubygems.org/
gem sources --add https://gems.ruby-china.org/

apt-get -y install gcc automake make
apt-get -y install zlib1g zlib1g-dev
apt-get -y install libxml2-dev libxslt-dev

gem install nokogiri -v 1.6.8.1 -- --use-system-libraries

gem install rails

gem install jekyll 

gem install github-pages

gem install jekyll-paginate jekyll-sitemap jekyll-feed jemoji

gem install addressable -v 2.4.0 && gem uninstall addressable -v 2.5.0 
gem install jekyll-sass-converter -v 1.3.0 && gem uninstall jekyll-sass-converter -v 1.5.0
gem install kramdown -v 1.11.1 && gem uninstall kramdown -v 1.12.0
gem install jekyll -v 3.3.0 && gem uninstall jekyll -v 3.3.1
gem install listen ffi rb-inotify 
gem install jekyll-mentions
gem install html-pipeline
