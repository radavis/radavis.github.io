---
layout: post
title: "Reverse SSH"
categories: cheatsheet
---

## Local Port Forwarding

`ssh -L`

Relay a port from a remote server to your local machine. (e.g. - access a remote database running on port xxxx, locally on port yyyy)

```
$ ssh -L 127.0.0.1:yyyy:localhost:xxxx username@remotehost.com
$ ssh -L 0.0.0.0:yyyy:localhost:xxxx username@remotehost.com
$ ssh -L [<LocalAddress>]:<LocalPort>:<RemoteHost>:<RemotePort> username@remotehost.com
```

## Remote Port Forwarding

`ssh -R`

Make a local port available on a remote server. (e.g. - run a webserver locally
on port xxxx, allow access to the webserver on a remote public server on port
yyyy)

```
$ ssh -R 50.220.10.200:yyyy:localhost:xxxx username@remotehost.com
$ ssh -R [<RemoteAddress>]:<RemotePort>:<LocalHost>:<LocalPort> sshUser@remoteServer
```

```
# /etc/ssh/sshd_config
GatewayPorts yes
```

## AutoSSH

```
# ~/.ssh/config
Host app-tunnel
    HostName remotehost.com
    User username
    Port 22
    IdentityFile ~/.ssh/id_rsa
    LocalForward yyyy localhost:xxxx
    ServerAliveInterval 30
    ServerAliveCountMax 3
```

```
$ autossh -M 0 -f -T -N app-tunnel
```

To make this persistent, create a [service](https://www.everythingcli.org/ssh-tunnelling-for-fun-and-profit-autossh/#gfm-8).

## Resources

* [SSH Tunneling for Fun and Profit](https://www.everythingcli.org/ssh-tunnelling-for-fun-and-profit-local-vs-remote/)
* [Create a systemd service](https://www.dexterindustries.com/howto/run-a-program-on-your-raspberry-pi-at-startup/#systemd)
* [How to set up proper start/stop services](https://blog.frd.mn/how-to-set-up-proper-startstop-services-ubuntu-debian-mac-windows/)
* [Mosh](https://mosh.org/)
