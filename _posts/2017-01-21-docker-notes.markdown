---
layout: post
title: "Docker Notes"
date: 2017-01-21 15:00
tags: docker
---

# References/Resources

* [Docker Toolbox Overview](https://docs.docker.com/toolbox/overview/)
* [Docker Getting Started Tutorial](https://docs.docker.com/engine/getstarted/)
* [Docker Hub](https://hub.docker.com/)
* [Dockerfile Reference](https://docs.docker.com/engine/reference/builder/)
* [Dockerize PostgreSQL](https://docs.docker.com/engine/examples/postgresql_service/)
* [Docker Self-Paced Online Training](https://training.docker.com/category/self-paced-online)
* [Docker ARG, ENV, and .env](https://vsupalov.com/docker-arg-env-variable-guide/)
* [Setting Default Docker Environment Variables During Image Build](https://vsupalov.com/docker-build-time-env-values/)
* [Docker Tutorial Series](https://rominirani.com/docker-tutorial-series-a7e6ff90a023)
* [How to use Entrypoint](https://medium.com/the-code-review/how-to-use-entrypoint-with-docker-and-docker-compose-1c2062aa17a2)

# Verify Installation

This command:

* creates and runs a **Docker container**
* in the container, the `hello-world` **image** is loaded

```
$ docker run hello-world
```

> An _image_ is a filesystem and parameters to use at runtime.

> A _container_ is a running instance of an image.

# List All Containers

```
$ docker ps -a
```

# List All Images

```
$ docker images
```

# Run a Container, with Arguments

```
$ docker run docker/whalesay cowsay boo
```

[Dockerfile](https://hub.docker.com/r/docker/whalesay/)

```
FROM ubuntu:14.04

# install cowsay, and move the "default.cow" out of the way so we can overwrite it with "docker.cow"
RUN apt-get update && \
    apt-get install -y cowsay --no-install-recommends && \
    rm -rf /var/lib/apt/lists/* && \
    mv /usr/share/cowsay/cows/default.cow /usr/share/cowsay/cows/orig-default.cow

# "cowsay" installs to /usr/games
ENV PATH $PATH:/usr/games

COPY docker.cow /usr/share/cowsay/cows/
RUN ln -sv /usr/share/cowsay/cows/docker.cow /usr/share/cowsay/cows/default.cow

CMD ["cowsay"]
```

### Common Commands

List running containers.

```
$ docker ps
```

View details of an image.

```
$ docker inspect image-name
```

Check if a specific container is running.

```
$ docker inspect --format "\{\{.State.Running\}\}" container-name
```

[link](https://stackoverflow.com/a/35528861)

View Logs

```
$ docker logs container-name
$ docker logs -f container-name
```

View ports

```
$ docker port container-name
```

Connect to running container

```
$ docker exec -it [container-id] bash
```

Restart container

```
$ docker restart container-name
```

Stop all running containers

```
$ docker stop $(docker ps -a -q)
```

Remove all containers

```
$ docker rm $(docker ps -a -q)
```

# Build an Image

Run the following command from a folder where a `Dockerfile` exists.

```
$ docker build -t username/image .
```

# Dockerfile

[Dockefile Examples](https://docs.docker.com/engine/reference/builder/#/dockerfile-examples)

```dockerfile
FROM <image>
LABEL version="1.0"
LABEL description="Description of this image."
LABEL maintainer "Richard Davis <radavis@example.com>"
WORKDIR /path/to/workdir
USER <username>
ENV <key> <value>
ADD <source> <destination>
COPY <source> <destination>
RUN <command>
EXPOSE <port>
VOLUME ["/data"]
CMD ["executable", "param1", "param2"]
ENTRYPOINT ["executable", "param1", "param2"]
ONBUILD [INSTRUCTION]
ARG <name>[=<default value>]
```

> The **LABEL** instruction adds metadata to an image.

> The **WORKDIR** instruction sets the working directory for any
> **RUN**, **CMD**, **ENTRYPOINT**, **COPY** and **ADD** instructions that
> follow it in the `Dockerfile`.

> The **ADD** instruction copies new files, directories or remote file URLs
> from `<src>` and adds them to the filesystem of the image at the path `<dest>`.

> The **COPY** instruction copies new files or directories from `<src>` and
> adds them to the filesystem of the container at the path `<dest>`.

> The **RUN** instruction will execute any commands in a new layer on top of
> the current image and commit the results.

> The **VOLUME** instruction creates a mount point with the specified name and
> marks it as holding externally mounted volumes from native host or other containers.

> The main purpose of a **CMD** is to provide defaults for an executing container.

> An **ENTRYPOINT** allows you to configure a container that will run as an executable.

> The **ONBUILD** instruction adds to the image a trigger instruction to be
> executed at a later time, when the image is used as the base for another
> build. The trigger will be executed in the context of the downstream build,
> as if it had been inserted immediately after the FROM instruction in the
> downstream `Dockerfile`.

> The **ARG** instruction defines a variable that users can pass at build-time
> to the builder with the docker build command using the
> `--build-arg <varname>=<value>` flag.
