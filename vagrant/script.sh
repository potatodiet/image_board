#!/bin/sh

sudo -u postgres createuser vagrant --createdb
sudo apt-get install imagemagick libmagickwand-dev -y
