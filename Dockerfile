FROM ubuntu:14.04

MAINTAINER Raphael Cazenave-Leveque<raphael.cazenave-leveque@etu.univ-lyon1.fr>

RUN \
  apt-get update && apt-get upgrade -y && \
  apt-get install gcc python-dev python-virtualenv -y && \
  apt-get clean

RUN \
  virtualenv ktbs-env && \
  cd ktbs-env
# source bin/activate

RUN \
  pip install ktbs

EXPOSE 8001
ENTRYPOINT ktbs --host-name=0.0.0.0

