servers=(
  18.183.182.198
  54.168.57.16
)

for ip in "${servers[@]}" ; do
    echo "[ ${ip} ]"
    ssh -i ~/Desktop/isucon7-final.pem ubuntu@${ip} 'bash /home/ubuntu/cco/webapp/ruby/deploy.sh'
done
