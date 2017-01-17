#!/bin/bash

echo "Generando network docker..."
docker network create sonar-network

echo "Iniciando postgres db..."
docker run --name pgsonar -e POSTGRES_USER=sonar -e POSTGRES_PASSWORD=secret -d -p 5432:5432 --net sonar-network postgres
#docker run --name sonar-postgres -e POSTGRES_USER=sonar -e POSTGRES_PASSWORD=secret -d -p 5432:5432 --net bsa-network postgres
#docker run --name sonar-postgres -e POSTGRES_USER=sonar -e POSTGRES_PASSWORD=secret -d -p 5432:5432 -e VIRTUAL_HOST=pgsonar postgres

DOCKER_FOLDER="$REPOS_HOME/sonarqpostgre"

cd $DOCKER_FOLDER

echo "Build de imagen sonar"
docker build -t sonarqpostgre .

echo "Iniciando sonar con base postgres"
#docker run -d --name sonar-bsa --link sonar-postgres:pgsonar -p 9000:9000 sonar-bsa
docker run -d --name sonarqpostgre -p 9000:9000 --net sonar-network sonarqpostgre
