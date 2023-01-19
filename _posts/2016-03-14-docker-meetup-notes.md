---
layout: post
title: "Docker Meetup Notes"
date: 2016-03-14 10:00
tags: docker bash
---

* install Boot2Docker.pkg
* user guide: https://docs.docker.com/userguide
* example docker environment: http://bit.ly/1NSJo51
* example web app: http://bit.ly/1dMcCFG
* CodeDojo dev environment: https://github.com/deviant-io/codedojo-docker
* slides: http://bit.ly/1RlkUqu

# the most basic example

```
$ docker run ubuntu:14.04 /bin/echo 'Hello world'
```

# basic command

```
$ docker run hello-world
```

* grabs the container (from dockerhub)
* launches it (the daemon)
* allows you to send messages to and from it

# container

a stripped down version of linux


# image

* container + other apps
* list all locally installed images with `docker images`


# another example

```
$ docker run docker/whalesay cowsay Hello, Whitney!
```

# an interactive container

```
$ docker run -t -i ubuntu:14.04 /bin/bash
```


# building an image

create a Dockerfile.

```
# Dockerfile
FROM docker/whalesay:latest
RUN apt-get -y update && apt-get install -y fortunes
CMD /usr/games/fortune -a | cowsay
```

build it. `docker-whale` will be the name of the image.

```
$ docker build -t docker-whale .
```

# other commands

```
$ docker version
$ docker ps  # view running processes
$ docker kill process-name  # kill a process
$ docker logs process-name
$ docker stop process-name
$ docker top process-name
$ docker inspect process-name
```

# Dockerfile - RUN vs CMD

RUN - you should only run a single process in a single container. mostly used to run `apt-get`.
CMD - should be used to run the software contained by your image

# Dockerfile instructions

* FROM
* RUN
* CMD
* EXPOSE
* ENV
* ADD
* COPY
* ENTRYPOINT
* VOLUME
* USER
* WORKDIR
* ONBUILD


# daemonize a command

```
$ docker run -d ubuntu:14.04 /bin/sh -c "while true; do echo hello world; sleep 1; done"
```

# stop a daemon

```
$ docker stop romantic_kowalevski
```

# running a webapp

```
$ docker run -d -P training/webapp python app.py
```
