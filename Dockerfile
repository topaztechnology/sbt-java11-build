FROM ubuntu:18.04

RUN \
  apt-get update && \
  apt-get -qy install curl zip git openjdk-11-jdk=11.0.6+10-1ubuntu1~18.04.1 && \
  curl -Ls https://git.io/sbt > /usr/bin/sbt && \
  chmod 0755 /usr/bin/sbt
