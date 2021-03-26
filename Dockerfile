FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN \
  apt-get update && \
  apt-get -qy install curl zip git openjdk-11-jdk=11.0.10+9-0ubuntu1~20.04 && \
  curl -Ls https://git.io/sbt > /usr/bin/sbt && \
  chmod 0755 /usr/bin/sbt

ARG SCALA_212_VERSION=2.12.12
ARG SCALA_213_VERSION=2.13.3
ARG SBT_VERSION=1.4.9

RUN \
  # Cache sbt and scala jars
  mkdir -p /root/cache/project && \
  mkdir -p /root/cache/src/main/scala && \
  echo "sbt.version=${SBT_VERSION}" > /root/cache/project/build.properties && \
  touch /root/cache/src/main/scala/Cache.scala && \
  echo "name := \"cache\"\n\nversion := \"1.0\"\n\nscalaVersion := \"${SCALA_212_VERSION}\"\n" > /root/cache/build.sbt && \
  cd /root/cache && \
  sbt -v clean compile && \
  echo "name := \"cache\"\n\nversion := \"1.0\"\n\nscalaVersion := \"${SCALA_213_VERSION}\"\n" > /root/cache/build.sbt && \
  sbt -v clean compile && \
  rm -r /root/cache
