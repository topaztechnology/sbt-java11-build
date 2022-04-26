FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN \
  apt-get update && \
  apt-get -qy install curl gnupg && \
  curl -sL https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
  echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list && \
  apt-get update && \
  apt-get -qy install curl zip unzip git ruby xsltproc google-chrome-stable && \
  rm -rf /var/lib/apt/lists/*

ENV CHROME_BIN /usr/bin/google-chrome-stable

SHELL ["/bin/bash", "-ic"]

ENV SDKMAN_DIR=/usr/local/sdkman

RUN \
  chmod -R 0777 /usr/local && \
  curl -s "https://get.sdkman.io?rcupdate=false" | bash && \
  echo "sdkman_auto_answer=true" > $SDKMAN_DIR/etc/config && \
  echo "sdkman_auto_selfupdate=false" >> $SDKMAN_DIR/etc/config && \
  echo "source $SDKMAN_DIR/bin/sdkman-init.sh" > /etc/bash.bashrc

RUN \
  sdk install java 11.0.15-zulu

RUN \
  curl -Ls https://git.io/sbt > /usr/bin/sbt && \
  chmod 0755 /usr/bin/sbt

ARG SBT_VERSION=1.6.2
ARG SCALA_VERSION=2.13.8

RUN \
  # Cache sbt and scala jars
  mkdir -p /root/cache/project && \
  mkdir -p /root/cache/src/main/scala && \
  echo "sbt.version=${SBT_VERSION}" > /root/cache/project/build.properties && \
  touch /root/cache/src/main/scala/Cache.scala && \
  echo -e "name := \"cache\"\n\nversion := \"1.0\"\n\nscalaVersion := \"${SCALA_VERSION}\"\n" > /root/cache/build.sbt && \
  cd /root/cache && \
  sbt -v clean compile && \
  rm -r /root/cache
