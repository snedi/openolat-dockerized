# openolat-dockerized

A dockerized version of the Learning Management System OpenOLAT intended to facilitate the installation process.

List of the components and corresponding Docker images that can be built by this project:
- Tomcat microservice
- PgSQL microservice

# USE

Each component includes its own `build.sh` and `run.sh` shell scripts to build and run the services. The scripts require the following environment variables to be defined.

```sh
export OPENOLAT_DOCKER_IMAGE_WEB="snedi/openolat-web"
export OPENOLAT_DOCKER_IMAGE_DB="snedi/openolat-db"
```