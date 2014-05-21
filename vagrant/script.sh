#!/bin/sh

apt-get install postgresql postgresql-contrib -y
apt-get install libpq-dev -y # Needed for bundler
apt-get install nfs-common portmap -y # Needed for nfs
apt-get install nodejs -y # Needed for asset pipeline
apt-get install imagemagick -y # Needed for carrierwave
apt-get install ruby-dev -y # Needed for rails
apt-get install build-essential g++ -y # Needed for thin

gem install bundler

sudo -u postgres createuser vagrant --createdb

cd /home/vagrant/code/image_board
sudo -u vagrant bundle install
sudo -u vagrant rake db:create
sudo -u vagrant rake db:migrate
