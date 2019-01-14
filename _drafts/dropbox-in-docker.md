# Dropbox in Docker

## janeczku/dropbox

```
docker run -d --restart=always --name=beastmaster-dropbox \
  -e DBOX_UID=502 \
  -e DBOX_GID=20 \
  -v /Users/rdavis/beastmaster-dropbox:/dbox/Dropbox \
  janeczku/dropbox
```

Issue:

```
[ALERT]: So your files continue to sync, sign in to your Dropbox account and move Dropbox to a supported file system.
```

Seems to be that this Docker image is using the ext2 filesystem, and Dropbox has
required an upgrade to ext4.

## drodgers/dropbox

[dockerhub](https://hub.docker.com/r/drodgers/dropbox/)
[github](https://github.com/elliottpost/docker-dropbox)

```
docker run -d --restart=always --name=beastmaster-dropbox \
  -v /Users/rdavis/beastmaster-dropbox:/dbox/Dropbox \
  drodgers/dropbox
```

Same issue:

```
[ALERT]: So your files continue to sync, sign in to your Dropbox account and move Dropbox to a supported file system.
```
