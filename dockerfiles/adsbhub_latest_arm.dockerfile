FROM alpine

COPY rootfs /

RUN apk add --no-cache socat iputils

ENTRYPOINT ["/usr/local/bin/docker_entrypoint.sh"]