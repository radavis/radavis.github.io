---
layout: post
title: "DigitalOcean"
date: 2018-03-28 14:00
tags: cloud
---

## Droplet Details

* os: Debian v9.4
* ip: 159.89.50.203
* username: radavis

## Generate SSH Key

```
$ ssh-keygen -t rsa -b 4096 -C "rdavis.bacs@gmail.com" -f ~/.ssh/id_rsa-digitalocean
```

```
# ~/.ssh/config

Host debian94
    HostName 159.89.50.203
    User radavis
    IdentityFile /Users/rd/.ssh/id_rsa-digitalocean
```

## Guides/Commands

* [x] - [Initial Server Setup with Debian 8][1]
* [x] - [How to Install and Use PostgreSQL 9.4 on Debian 8][2]
* [x] - `apt-get install freeradius`
* [x] - [chruby](https://github.com/postmodern/chruby)
* [x] - [ruby-install](https://github.com/postmodern/ruby-install)


[1]: https://www.digitalocean.com/community/tutorials/initial-server-setup-with-debian-8
[2]: https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-9-4-on-debian-8
