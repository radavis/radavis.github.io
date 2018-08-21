---
layout: post
title: "Finding Devices on Your Local Network"
date: 2018-03-23 12:00
tags: bash
categories: cli
---

## with nmap

```
$ brew install nmap  # or sudo apt-get install nmap
$ sudo nmap -sP 192.168.1.1/24
Starting Nmap 7.60 ( https://nmap.org ) at 2018-03-23 12:00 EDT
Nmap scan report for FIOS_Quantum_Gateway.fios-router.home (192.168.1.1)
Host is up (0.046s latency).
MAC Address: 48:FF:FF:FF:FF:FF (Verizon)
Nmap scan report for Living-Room.fios-router.home (192.168.1.100)
Host is up (0.012s latency).
MAC Address: 78:FF:FF:FF:FF:FF (Arris Group)
...
```

[link](https://nmap.org/book/install.html)


## with fing

```
$ brew cask install fing
$ sudo fing
11:53:32 > Discovery profile: Default discovery profile
11:53:32 > Discovery class:   data-link (data-link layer)
11:53:32 > Discovery on:      192.168.1.0/24

11:53:32 > Discovery round starting.
11:53:32 > Host is up:   192.168.1.151
           HW Address:   6C:FF:FF:FF:FF:FF
           Hostname:     richards-mbp.fios-router.home

11:53:32 > Host is up:   192.168.1.1
           HW Address:   48:FF:FF:FF:FF:FF
           Hostname:     fios_quantum_gateway.fios-router.home

11:53:32 > Host is up:   192.168.1.100
           HW Address:   78:FF:FF:FF:FF:ff
           Hostname:     living-room.fios-router.home

...
```

[link](http://macappstore.org/fing/)

[fingkit downloads page](https://www.fing.io/fingkit-sdk-downloads/)
