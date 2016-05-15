#!/bin/sh

yum -y install git openssl-devel readline-devel zlib-devel

su - vagrant -c 'git clone https://github.com/rbenv/rbenv.git ~/.rbenv'
su - vagrant -c 'git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build'
su - vagrant -c 'cd ~/.rbenv && src/configure && make -C src'
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> /home/vagrant/.bash_profile
echo 'eval "$(rbenv init -)"' >> /home/vagrant/.bash_profile

su - vagrant -c 'rbenv install 2.3.0'
su - vagrant -c 'rbenv local 2.3.0'

su - vagrant -c 'gem install rails -v 4.2.6'
