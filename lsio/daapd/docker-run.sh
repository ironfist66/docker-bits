# [Daapd](https://owntone.github.io/owntone-server/) (iTunes) media server with
# support for AirPlay devices, Apple Remote (and compatibles), Chromecast, MPD
# and internet radio.

. ./.env
docker run -d \
  --name=daapd \
  --net=host `# Shares host networking with container.` \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 80:80 `# Application WebUI` \
  -v ${BASEDIR:-/volume1/docker}/daapd/config:/config `# Where daapd server stores its config and dbase files.` \
  -v ${BASEDIR:-/volume1/docker}/daapd/music:/music `# Map to your music folder.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/daapd
