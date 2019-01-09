```
docker run -d --restart=always --name=beastmaster-dropbox \
  -e DBOX_UID=502 \
  -e DBOX_GID=20 \
  -v /Users/rdavis/beastmaster-dropbox:/dbox/Dropbox \
  janeczku/dropbox
```

# Issue

```
[ALERT]: So your files continue to sync, sign in to your Dropbox account and move Dropbox to a supported file system.
```
