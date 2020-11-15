# docker network inspect bridge | jq .[0].Containers | grep IPv4Address

docker run -d \
    --name olat-nginx \
    -p 8080:8080 \
    -v $PWD/openolat.conf:/etc/nginx/conf.d/openolat.conf \
    $NGINX_IMAGE
