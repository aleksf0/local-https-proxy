#!/bin/bash

current_dir=${BASH_SOURCE%/*}

CID=$(docker container run -t -d nicolaka/netshoot) \
&& docker cp "$current_dir"/docker-exec-cmd.sh "${CID}":/tmp/docker-exec-cmd.sh \
&& docker exec -it "${CID}" bash -c //tmp/docker-exec-cmd.sh \
&& docker cp "${CID}":/etc/ssl/generated/. "$current_dir" \
&& printf "The certificate and private key have been generated at $current_dir\n" \
&& docker container rm -f "${CID}"