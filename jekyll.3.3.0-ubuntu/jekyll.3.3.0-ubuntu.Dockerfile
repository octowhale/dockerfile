FROM ubuntu:latest
MAINTAINER octowhale@github

# Dockerfile for jekyll 3.3.0 on ubuntu 16:10
# 


RUN apt-get -y update
RUN apt-get -y install ruby ruby-dev ruby-ffi

RUN gem sources --remove https://rubyRUN gems.org/ --add https://RUN gems.ruby-china.org/


RUN apt-get -y install 
RUN apt-get -y install gcc automake make
RUN apt-get -y install zlib1g zlib1g-dev
RUN apt-get -y install libxml2-dev libxslt-dev

RUN gem install nokogiri -v 1.6.8.0 -- --use-system-libraries

RUN gem install rails

RUN gem install jekyll -v 3.3.0

RUN gem install github-pages

RUN gem install jekyll-paginate jekyll-sitemap jekyll-feed jemoji

RUN gem install addressable -v 2.4.0 && RUN gem uninstall addressable -v 2.5.0 
RUN gem install jekyll-sass-converter -v 1.3.0 && RUN gem uninstall jekyll-sass-converter -v 1.5.0
RUN gem install kramdown -v 1.11.1 && RUN gem uninstall kramdown -v 1.12.0

# CMD jekyll serve -w --host 0.0.0.0 -s /root/octowhale.github.io/
# CMD jekyll serve -w --host 0.0.0.0 -s $JEKYLL_HOME
# ENTRYPOINT ['/usr/local/bin/jekyll','serve','-w','--host 0.0.0.0']
