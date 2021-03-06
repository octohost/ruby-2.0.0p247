FROM ubuntu:precise
MAINTAINER Darron Froese <darron@froese.org>

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y build-essential curl git-core libxslt-dev libxml2-dev
RUN curl -L https://get.rvm.io | bash -s stable

ENV PATH /usr/local/rvm/gems/ruby-2.0.0-p247/bin:/usr/local/rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN /bin/bash -l -c 'rvm install 2.0.0-p247'
RUN gem install foreman nokogiri
RUN gem install bundler --no-ri --no-rdoc
RUN apt-get install -y libmysqlclient-dev
RUN apt-get install -y libpq-dev

CMD /bin/bash -l -c 'rvm use 2.0.0-p247 --default'
