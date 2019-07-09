# Docker bind-mount

## Examples

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

## Keep in mind...

* A container should run a single process.
* A container should expose a service on a port.

## Features

* [ ] a single command to run the application in {dev,test,prod} mode
* [ ] a unified, `tail`-able log
* [ ] a list of pages to explore: app, api-docs, spec reports

**Development**

- postgres:10.7
  * process: default
- reqworks-api
  * process: ``
  * process: `npm start` (api, api-documentation) on port 8080
  * process: `npm run test`
- reqworks-app
  * process: `npm start (app)` on port 3000
  * process: `npm run storybook` on port 9009
  * process: `npm run test`

## Resources

* [Docker: Use bind mounts](https://docs.docker.com/v17.09/engine/admin/volumes/bind-mounts/)
* [Docker: Development best practices](https://docs.docker.com/v17.12/develop/dev-best-practices/)
* [Docker Compose - A Developer's Guide](https://developer.okta.com/blog/2017/10/11/developers-guide-to-docker-part-3)
* [Building Your First Node App Using Docker](https://www.javascriptjanuary.com/blog/building-your-first-node-app-using-docker)
* [Docker: Data Volumes](https://rominirani.com/docker-tutorial-series-part-7-data-volumes-93073a1b5b72)
* [How to write great container images](https://blog.bejarano.io/how-to-write-great-container-images.html)
