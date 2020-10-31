# docker network inspect bridge | jq .[0].Containers | grep IPv4Address
# docker run -it --rm -p 8088:8088 --name openolat2 my/openolat2 sh

docker run -d -p 2001:8088 --name openolat1 my/openolat2
docker run -d -p 2002:8088 --name openolat2 my/openolat2
docker run -d -p 2003:8088 --name openolat3 my/openolat2
