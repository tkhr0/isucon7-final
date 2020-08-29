#!/bin/bash

# kill puma
ps aux | grep "puma 3" | grep -v grep | awk '{ print "kill -9", $2 }' | sh

# git
cd /home/ubuntu/work/isucon7-final
git pull

# start puma
cd /home/ubuntu/work/isucon7-final/webapp/ruby
bundle exec puma -C puma_config.rb