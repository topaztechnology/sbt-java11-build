FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN \
  apt-get update && \
  apt-get -qy install curl zip git unzip && \
  apt-get -qy install libxt-dev libfontconfig1 libfreetype6 libharfbuzz0b libjpeg8 liblcms2-2 libnss3 libstdc++6 util-linux zlib1g

RUN \
  curl -s "https://get.sdkman.io?rcupdate=false" | bash && \
  chmod a+x "$HOME/.sdkman/bin/sdkman-init.sh" && \
  /bin/bash -c "source "$HOME/.sdkman/bin/sdkman-init.sh" && sdk install java 11.0.13-tem"

RUN \
  curl -Ls https://git.io/sbt > /usr/bin/sbt && \
  chmod 0755 /usr/bin/sbt

ARG SBT_VERSION=1.5.6
ARG SCALA_VERSION=2.13.7

RUN \
  # Cache sbt and scala jars
  mkdir -p /root/cache/project && \
  mkdir -p /root/cache/src/main/scala && \
  echo "sbt.version=${SBT_VERSION}" > /root/cache/project/build.properties && \
  touch /root/cache/src/main/scala/Cache.scala && \
  echo "name := \"cache\"\n\nversion := \"1.0\"\n\nscalaVersion := \"${SCALA_VERSION}\"\n" > /root/cache/build.sbt && \
  cd /root/cache && \
  /bin/bash -c "source "$HOME/.sdkman/bin/sdkman-init.sh" && sbt -v clean compile" && \
  rm -r /root/cache
