#!/bin/bash

apt update
apt install git unzip zip -y

curl -s "https://get.sdkman.io" | bash
source "/root/.sdkman/bin/sdkman-init.sh"
sdk install java 21.0.5-tem

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

git clone https://github.com/alexgutjahr/jobrunr-dst.git
cd jobrunr-dst
JAVA_HOME=/root/.sdkman/candidates/java/current ./gradlew build -x test

timedatectl set-ntp no
timedatectl set-timezone UTC
timedatectl set-time 2024-10-27
timedatectl set-time 01:04:00

docker run --name postgres -e POSTGRES_DB=jobrunr -e POSTGRES_PASSWORD=jobrunr -e POSTGRES_USER=jobrunr -p 5432:5432 -d postgres:16.3

export SPRING_DATASOURCE_URL=jdbc:postgresql://localhost:5432/jobrunr
export SPRING_DATASOURCE_USERNAME=jobrunr
export SPRING_DATASOURCE_PASSWORD=jobrunr

/root/.sdkman/candidates/java/current/bin/java -jar build/libs/jobrunr-0.0.1-SNAPSHOT.jar
