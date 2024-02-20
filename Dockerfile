FROM alpine:latest

LABEL maintainer="Papela"

RUN apk update && apk add curl bash && \
	adduser noip-user -D -h /home/noip/ -s /bin/sh -u 2000
		
COPY --chown=noip-user:noip-user noip-updater.sh /home/noip/noip-updater.sh

RUN	chmod u+x /home/noip/noip-updater.sh

WORKDIR /home/noip

ENV	NOIP_INTERVAL=60

USER noip-user

ENTRYPOINT /bin/bash /home/noip/noip-updater.sh