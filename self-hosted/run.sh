#!/usr/bin/env bash

podman run \
 --detach \
 --label "io.containers.autoupdate=registry" \
 --name myjellyfin \
 --publish 8096:8096/tcp \
 --rm \
 --volume jellyfin-cache:/cache:Z \
 --volume jellyfin-config:/config:Z \
 --volume /run/media/gcoda/MusicCard:/mediacard:Z \
 docker.io/jellyfin/jellyfin:latest

# --userns keep-id \
# --user $(id -u):$(id -g) \

#  --mount type=bind,source=/run/media/gcoda/MusicCard,destination=/mediacard,rw=true \
