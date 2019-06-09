```
docker container run \
  --detach \
  --publish 80:80 \
  --name linux_tweet_app \
  --mount type=bind,source="$(pwd)",target=/usr/share/nginx/html \
  $DOCKERID/linux_tweet_app:1.0
```

```
docker container run \
  --detach \
  --publish 8080:8080 \
  --name linux_tweet_app \
  --mount type=bind,source="$(pwd)",target=/usr/src/app \
  $DOCKERID/node:8.12.0
```
