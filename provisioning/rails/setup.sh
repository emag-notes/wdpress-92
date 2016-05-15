#!/bin/sh

su - vagrant -c '\
  cd /vagrant/todo \
  && bundle install \
  && bin/rake db:migrate \
  && npm install \
  && npm run build \
  && bin/rails s -b 192.168.101.10 &'
