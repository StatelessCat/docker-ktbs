FROM ubuntu:14.04

MAINTAINER Raphael Cazenave-Leveque<raphael.cazenave-leveque@etu.univ-lyon1.fr>

RUN \
  apt-get update && apt-get upgrade -y && \
  apt-get install gcc python-dev python-virtualenv haproxy -y && \
  apt-get clean

RUN \
  virtualenv ktbs-env && \
  cd ktbs-env
# source bin/activate

RUN \
  pip install ktbs

RUN \
  sed -i "s/ENABLED=0/ENABLED=1/g" /etc/default/haproxy                               && \
  sed -i "s/ENABLED=0/ENABLED=1/g" /etc/init.d/haproxy                                && \
  echo "frontend http-in"                                 >> /etc/haproxy/haproxy.cfg && \
  echo "        bind *:8002"                                >> /etc/haproxy/haproxy.cfg && \
  echo "        default_backend servers"                  >> /etc/haproxy/haproxy.cfg && \
  echo "backend servers"                                  >> /etc/haproxy/haproxy.cfg && \
  echo "        server server1 127.0.0.1:8001 maxconn 32" >> /etc/haproxy/haproxy.cfg

EXPOSE 8002
ENTRYPOINT /etc/init.d/haproxy start ; ktbs

