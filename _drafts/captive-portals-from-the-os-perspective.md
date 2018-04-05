---
layout: post
title: "Captive Portals from the OS Perspective"
date: 2018-03-26 17:45
tags: wifi
---

## Windows 8/10

> To determine Internet connectivity and captive portal status when a client
> first connects to a network, Windows performs a series of network tests. The
> destination site of these tests is www.msftncsi.com, which is a reserved
> domain that is used exclusively for connectivity testing.

**Do not allow access to www.msftncsi.com when the user does not have access to the Internet.**


## macOS

Immediately after connecting to a WiFi network, a request is made to
`http://captive.apple.com/hotspot-detect.html`. If a redirect is made, the
Captive Network Assistant window pops up...

![Apple CNA](/assets/images/apple-captive-network-assistant.png)

## Resources

* [Microsoft: Captive Portals][1]
* [Apple Captive Portal Network Assistant][2]

[1]: https://docs.microsoft.com/en-us/windows-hardware/drivers/mobilebroadband/captive-portals
[2]: https://alexmeub.com/apple-captive-network-assistant-macos/
