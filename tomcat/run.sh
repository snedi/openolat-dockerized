# docker network inspect bridge | jq .[0].Containers

docker run -d -p 2001:8088 --name openolat1 $OPENOLAT_DOCKER_IMAGE_WEB
docker run -d -p 2002:8088 --name openolat2 $OPENOLAT_DOCKER_IMAGE_WEB
docker run -d -p 2003:8088 --name openolat3 $OPENOLAT_DOCKER_IMAGE_WEB
