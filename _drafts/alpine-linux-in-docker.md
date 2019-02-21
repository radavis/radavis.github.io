# Alpine Linux in Docker

Run a command in a container

```
docker run -it alpine:3.9 \
  sh
```


## Setup and install transmission

```
apk update && apk upgrade
apk add \
  nano \
  openrc \
  transmission-daemon
rc-service transmission-daemon stop
nano /var/lib/transmission-daemon/info/settings.json
```
