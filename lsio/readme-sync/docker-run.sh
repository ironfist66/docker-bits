# This container needs special attention. Please check https://hub.docker.com/r/linuxserver/readme-sync for details.
. ./.env
docker run -d \
  --name=readme-sync \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 80:80 `# Application WebUI` \
  -v ${BASEDIR:-/volume1/docker}/readme-sync/config:/config `# Configuration files.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/readme-sync
