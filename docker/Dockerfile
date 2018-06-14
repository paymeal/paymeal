FROM debian:stretch
LABEL maintainer="Paymeal Developers <dev@paymeal.org>"
LABEL description="Dockerised PaymealCore, built from Travis"

RUN apt-get update && apt-get -y upgrade && apt-get clean && rm -fr /var/cache/apt/*

COPY bin/* /usr/bin/
