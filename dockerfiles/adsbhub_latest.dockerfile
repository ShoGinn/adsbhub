FROM alpine

COPY rootfs /

RUN apk add --no-cache bash socat iputils

ENTRYPOINT ["/usr/local/bin/docker_entrypoint.sh"]