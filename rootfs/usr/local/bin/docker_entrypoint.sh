#!/usr/bin/env bash

set -o errexit # Exit on most errors (see the manual)
#set -o errtrace         # Make sure any error trap is inherited
set -o nounset # Disallow expansion of unset variables
#set -o pipefail # Use last non-zero exit code in a pipeline
#set -o xtrace # Trace the execution of the script (debug)

DUMP1090_SERVER=${DUMP1090_SERVER:=dump1090}
DUMP1090_PORT=${DUMP1090_PORT:=30002}
SOCAT_SERVER=${SOCAT_SERVER:=data.adsbhub.org}
SOCAT_PORT=${SOCAT_PORT:=5001}
SOCAT_OPTIONS=(-d -d -lm -u)

echo "Waiting for dump1090 to start up"
sleep 5s

echo "Ping test to dump1090"
ping -c 3 "${DUMP1090_SERVER}"

echo "---------------"
echo "Starting replay from TCP:${DUMP1090_SERVER}:${DUMP1090_PORT} to TCP:${SOCAT_SERVER}:${SOCAT_PORT} with options"
echo "${SOCAT_OPTIONS[@]}"
echo "---------------"

exec /usr/bin/socat "${SOCAT_OPTIONS[@]}" 'TCP:'${DUMP1090_SERVER}:${DUMP1090_PORT} 'TCP:'${SOCAT_SERVER}:${SOCAT_PORT} \
  "${@}"
