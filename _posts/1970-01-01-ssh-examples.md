---
layout: post
title: "ssh"
categories: cheatsheet
---

## Connect to remote Secure Shell (SSH) server

```
ssh -v -p 22 -C neo@remoteserver
```

## Configure Authentication for Remote SSH Servers

```
Host *
     Port 2222

Host jumphost
     HostName [hostname or ip]
     User admin
     Port 2112
     IdentityFile ~/.ssh/remoteserver.private_key
```

## Copy file to remote server

```
scp mypic.png admin@jumphost:/media/data/mypic_2.png
```

## Add public ssh key to remote server's authorized_keys

Two different ways (choose one):

```
cat ~/.ssh/id_rsa.pub | ssh user@hostname 'cat >> .ssh/authorized_keys'
ssh-copy-id user@hostname
```

## Resources

* [SSH Examples, Tips & Tunnels](https://hackertarget.com/ssh-examples-tunnels/)
* [Set up SSH public-key authentication to connect to a remote system](https://kb.iu.edu/d/aews)
