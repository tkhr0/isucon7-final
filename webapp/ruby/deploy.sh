#!/bin/bash
source ~/.profile

# kill puma
ps aux | grep "puma 3" | grep -v grep | awk '{ print "kill -9", $2 }' | sh

# git
cd /home/ubuntu/cco
git checkout .
git pull

# start puma
cd /home/ubuntu/cco/webapp/ruby
RACK_ENV=production bundle
RACK_ENV=production bundle exec puma -C puma_config.rb -e production
