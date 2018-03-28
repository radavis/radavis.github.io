---
layout: post
title: "CoovaChilli"
date: 2018-03-28 14:00
tags: captive-portal
---

## Installation on Debian 9.4

First, get the necessary tools to run `debuild`

```
$ sudo apt-get update
$ sudo apt-get install build-essential fakeroot devscripts gengetopt libssl-dev libjson-c-dev
```

```
$ wget https://github.com/coova/coova-chilli/archive/1.4.tar.gz -O coova-chilli-1.4.tar.gz
$ tar xzf coova-chilli-1.4.tar.gz
$ cd coova-chilli-1.4
$ ./bootstrap
$ ./configure --enable-miniportal --prefix=/tmp/foo
$ make
$ make install
```

`/tmp/foo` should be changed to `/usr/local` or `/usr` or `/etc`

## Resources

* [CoovaChilli distribution building](http://coova.github.io/CoovaChilli/DistroBuilding/)
* [https://github.com/coova/coova-chilli/blob/master/INSTALL]
