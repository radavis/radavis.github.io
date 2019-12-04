[source](https://training.play-with-docker.com/beginner-linux/)


## Run an interactive container

```
$ docker container run --interactive --tty --rm ubuntu bash
```

* `--interactive` says you want an interactive session.
* `--tty` allocates a pseudo-tty.
* `--rm` remove the container when it's done executing.


## Run a background container

```
$ docker container run \
    --detach \
    --name mydb \
    -e MYSQL_ROOT_PASSWORD=my-secret-pw \
    mysql:latest
```

* `--detach` will run the container in the background.
* `--name` will name it mydb.
* `-e` will use an environment variable to specify the root password


## Resources

* [docker katas](https://github.com/praqma-training/docker-katas)
