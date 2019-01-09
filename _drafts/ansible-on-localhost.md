# Ansible on localhost


## Requirements

* Ansible
* Docker
* Python3


## Setup

Create a couple of containers running Ubuntu.

```
$ docker pull python:3-stretch
$ docker run -it -d --name server01.local python:3-stretch /bin/bash
$ docker run -it -d --name server02.local python:3-stretch /bin/bash
```

Tell Ansible how to connect to the Docker containers

```
# inventory file

[servers]
server01.local
server02.local

[servers:vars]
ansible_connection=docker
```


## Interact with the Docker Images

```
$ ansible all --inventory-file=inventory --module-name ping
$ ansible all -i inventory -m ping
$ ansible all -i inventory --args uptime
```


## Cleanup

```
$ docker stop server01.local server02.local
$ docker rm server01.local server02.local
```
