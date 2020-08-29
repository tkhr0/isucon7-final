bind 'unix:///home/ubuntu/tmp/puma.sock'
daemonize true
preload_app!

workers 2
threads 16, 16