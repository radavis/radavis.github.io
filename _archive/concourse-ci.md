# Concourse CI

An open-source CI/CD pipeline system.


## Components

### Resource

A resource is an input or output of a job. Examples:

* a git repository
* a docker image
* an s3 bucket
* a slack notification

[resource types](https://github.com/concourse/concourse/wiki/Resource-Types)


### Task

A task is the smallest configurable unit of work in a concourse pipeline. Think
of a task as a function that takes an input, and returns some output.


### Job

Jobs determine how resources progress through the pipeline.


## Tutorial

### Introduction

* Deploy Concourse via Docker Compose
* Install `fly` command
* Create fly target to running Concourse instance (named 'tutorial')

```
wget https://raw.githubusercontent.com/starkandwayne/concourse-tutorial/master/docker-compose.yml
docker-compose up -d
brew cask install fly
fly --target tutorial login --concourse-url http://127.0.0.1:8080 -u admin -p admin
fly --target tutorial sync
docker-compose down  # when done
```


## Resources

* [homepage](https://concourse-ci.org/)
* [documentation](https://concourse-ci.org/docs.html)
* [tutorial](https://concoursetutorial.com/)
* [concourse-ci & docker](https://blog.anynines.com/getting-started-with-concourse-ci-and-docker/)
* [flight school](https://github.com/praqma-training/concourse/blob/master/flightschool.md)
* [tutorial (specify.io)](https://specify.io/how-tos/concourse-ci-continious-integration-and-delivery-of-microservices)


## Try this

* [selenium-example](https://github.com/pivotal-kahin-ng/selenium-example)
* [docker-java-chromedriver](https://github.com/pivotal-kahin-ng/docker-java-chromedriver/blob/master/Dockerfile)
