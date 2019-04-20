# adsbhub
ADSBhub.org feeder using socat

This is part of a suite of applications that can be used if you have a dump1090 compatible device including:
* Any RTLSDR USB device
* Any network AVR or BEAST device
* Any serial AVR or BEAST device

# Container Requirements

This is a multi architecture build that supports arm (armhf/arm64) and amd64

You must first have a running setup for before using this container as it will not help you on initial setup

# Container Setup

Env variables can be passed to the container containing the dump1090 optional items

### Defaults
* DUMP1090_SERVER=dump1090 -- make sure your dump1090 container is named this and on the same network
* DUMP1090_PORT=30005 -- default port


### User Configured
* Nothing required

#### Example docker run

```
docker run -d \
--restart unless-stopped \
--name='adsbhub' \
shoginn/adsbhub:latest-amd64

```
# Status
| branch | Status |
|--------|--------|
| master | [![Build Status](https://travis-ci.org/ShoGinn/adsbhub.svg?branch=master)](https://travis-ci.org/ShoGinn/adsbhub) |

| Arch | Size/Layers | Commit |
|------|-------------|--------|
[![](https://images.microbadger.com/badges/version/shoginn/adsbhub:latest-arm.svg)](https://microbadger.com/images/shoginn/adsbhub:latest-arm "Get your own version badge on microbadger.com") | [![](https://images.microbadger.com/badges/image/shoginn/adsbhub:latest-arm.svg)](https://microbadger.com/images/shoginn/adsbhub:latest-arm "Get your own image badge on microbadger.com") | [![](https://images.microbadger.com/badges/commit/shoginn/adsbhub:latest-arm.svg)](https://microbadger.com/images/shoginn/adsbhub:latest-arm "Get your own commit badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/shoginn/adsbhub:latest-arm64.svg)](https://microbadger.com/images/shoginn/adsbhub:latest-arm64 "Get your own version badge on microbadger.com") | [![](https://images.microbadger.com/badges/image/shoginn/adsbhub:latest-arm64.svg)](https://microbadger.com/images/shoginn/adsbhub:latest-arm64 "Get your own image badge on microbadger.com") | [![](https://images.microbadger.com/badges/commit/shoginn/adsbhub:latest-arm64.svg)](https://microbadger.com/images/shoginn/adsbhub:latest-arm64 "Get your own commit badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/shoginn/adsbhub:latest-amd64.svg)](https://microbadger.com/images/shoginn/adsbhub:latest-amd64 "Get your own version badge on microbadger.com") | [![](https://images.microbadger.com/badges/image/shoginn/adsbhub:latest-amd64.svg)](https://microbadger.com/images/shoginn/adsbhub:latest-amd64 "Get your own image badge on microbadger.com") | [![](https://images.microbadger.com/badges/commit/shoginn/adsbhub:latest-amd64.svg)](https://microbadger.com/images/shoginn/adsbhub:latest-amd64 "Get your own commit badge on microbadger.com")

