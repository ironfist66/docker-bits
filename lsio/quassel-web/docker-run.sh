# [Quassel-web](https://github.com/magne4000/quassel-webserver) is a web client
# for Quassel. Note that a Quassel-Core instance is required, we have a
# container available [here.](https://hub.docker.com/r/linuxserver/quassel-
# core/)

. ./.env
docker run -d \
  --name=quassel-web \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e QUASSEL_CORE=192.168.1.10 `# specify the URL or IP address of your Quassel Core instance` \
  -e QUASSEL_PORT=4242 `# specify the port of your Quassel Core instance` \
  -e URL_BASE=/quassel `# optional` `# Specify a url-base in reverse proxy setups ie. `/quassel`` \
  -p 64443:64443 `# Quassel-web https webui` \
  -v ${BASEDIR:-/volume1/docker}/quassel-web/config:/config `# this will store config on the docker host` \
  --restart unless-stopped \
  ghcr.io/linuxserver/quassel-web
