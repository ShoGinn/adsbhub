# adsbhub

ADSBhub.org feeder using socat

This is part of a suite of applications that can be used if you have a dump1090 compatible device including:

* Any RTLSDR USB device
* Any network AVR or BEAST device
* Any serial AVR or BEAST device

## Container Requirements

This is a multi architecture build that supports arm (armhf/arm64) and amd64

You must first have a running setup for before using this container as it will not help you on initial setup

## Container Setup

Env variables can be passed to the container containing the dump1090 optional items

### Defaults

* DUMP1090_SERVER=dump1090 -- make sure your dump1090 container is named this and on the same network
* DUMP1090_PORT=30005 -- default port

### User Configured

* Nothing required

#### Example docker run

```bash
docker run -d \
--restart unless-stopped \
--name='adsbhub' \
shoginn/adsbhub:latest-amd64

```

## Status

![Docker Pulls](https://img.shields.io/docker/pulls/shoginn/adsbhub)

| branch | Status |
|--------|--------|
| master | [![Build Status](https://travis-ci.com/ShoGinn/adsbhub.svg?branch=master)](https://travis-ci.com/ShoGinn/adsbhub) |
