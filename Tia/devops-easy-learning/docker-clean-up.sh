#!/bin/bash

docker rm -f $(docker ps -aq) || true
docker rmi -f $(docker images -aq) || true
docker volume prune -f  || true
docker system prune -af || true
docker system prune -f -a  || true
docker load < /root/master-ubuntu-image.tar
docker load < /root/master-ubuntu-image-cluster4.tar
docker load < /root/master-ubuntu-image-cluster3.tar
