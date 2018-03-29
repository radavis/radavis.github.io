---
layout: post
title: "Hostname"
date: 2018-03-28 20:30
tags: hostname
---

## Check Hostname

```
$ hostname
```

## Set Hostname

### macOS

```
$ sudo scutil --set HostName error-eradicator
$ dscacheutil -flushcache
```

### Linux/Unix

```
$ sudo echo pi-b512 > hostname
$ sudo reboot
```

### Windows

[unclear](https://stackoverflow.com/questions/54989/change-windows-hostname-from-command-line)
