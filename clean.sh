docker system prune -a

docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

docker rmi -f $(docker iamges -a -q)
