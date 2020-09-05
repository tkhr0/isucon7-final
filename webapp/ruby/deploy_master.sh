for ip in "$@" ; do
    echo "[ ${ip} ]"
    ssh -i ~/Desktop/isucon7-final.pem ubuntu@${ip} 'bash /home/ubuntu/cco/webapp/ruby/deploy.sh'
done
