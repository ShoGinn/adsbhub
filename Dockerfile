ARG BASE=alpine
FROM $BASE

ARG arch=none
ENV ARCH=$arch

COPY qemu/qemu-$ARCH-static* /usr/bin/

RUN apk add --no-cache socat iputils

COPY adsbhub-client.sh /usr/local/bin/adsbhub-client
ENTRYPOINT ["adsbhub-client"]

# Metadata
ARG VCS_REF="Unknown"
LABEL maintainer="ginnserv@gmail.com" \
      org.label-schema.name="Docker ADS-B - adsbhub" \
      org.label-schema.description="Docker container for ADS-B - This is the adsbhub.org component" \
      org.label-schema.url="https://github.com/ShoGinn/adsbhub" \
      org.label-schema.vcs-ref="${VCS_REF}" \
      org.label-schema.vcs-url="https://github.com/ShoGinn/adsbhub" \
      org.label-schema.schema-version="1.0"