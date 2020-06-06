FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN \
  apt-get update && \
  apt-get -qy install curl zip git openjdk-11-jdk=11.0.7+10-3ubuntu1 && \
  curl -Ls https://git.io/sbt > /usr/bin/sbt && \
  chmod 0755 /usr/bin/sbt

ARG SCALA_VERSION=2.12.11
ARG SBT_VERSION=1.3.12

RUN \
  # Cache sbt and scala jars
  mkdir -p /root/cache/project && \
  mkdir -p /root/cache/src/main/scala && \
  echo "sbt.version=${SBT_VERSION}" >> /root/cache/project/build.properties && \
  touch /root/cache/src/main/scala/Cache.scala && \
  cd /root/cache && \
  sbt -v -scala-version ${SCALA_VERSION} compile && \
  rm -r /root/cache
