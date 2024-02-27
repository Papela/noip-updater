FROM ubuntu:latest

LABEL maintainer="Papela"

RUN apt update && apt install -y curl bash

RUN groupadd -g 2000 noip-user && useradd -r -u 2000 -g noip-user noip-user

COPY --chown=noip-user:noip-user noip-updater.sh /home/noip/noip-updater.sh

RUN chmod u+x /home/noip/noip-updater.sh

WORKDIR /home/noip

ENV NOIP_INTERVAL=60

USER noip-user

ENTRYPOINT /bin/bash /home/noip/noip-updater.sh