docker run -d \
    --name olat-postgres \
    -e POSTGRES_PASSWORD=olat \
    -p 5432:5432 \
    -v $PWD/data:/var/lib/postgresql/data \
    -v $PWD/init-db.sh:/docker-entrypoint-initdb.d/init-db.sh \
    my/openolat2-db:latest