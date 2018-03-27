---
layout: post
title: "Notes on freeRADIUS"
date: 2018-03-26 17:45
tags: radius wifi
---

## Overview

* Installation
* Verification via PAP (Plain-text passwords)
* Configure Secure Authentication via EAP

## Installation

For Linux:

```
$ sudo apt-get update
$ sudo apt-get install freeradius
```

For Mac:

```
$ brew install freeradius-server
```

* Server daemon: `freeradius` or `radiusd`
* Configuration files: `/etc/freeradius` or `/etc/raddb`


## Start the server in debug mode

> The default configuration is designed to work everywhere, and to perform nearly every authentication method.

```
$ freeradius -X
```

Test it, then add more users, and configure databases.

[freeRADIUS technical guide](http://networkradius.com/doc/FreeRADIUS%20Technical%20Guide.pdf)

## Test the freeRADIUS installation

[Instructions](http://wiki.freeradius.org/guide/Getting%20Started#initial-tests)

```
# /etc/freeradius/3.0/mods-config/files/authorization
# symlinked to /etc/freeradius/3.0/users
testing Cleartext-Password := "password"
```

In another terminal Session...

```
$ radtest testing password 127.0.0.1 0 testing123
```

## Add a Client (WAP, NS, or NAS)

```
# /etc/freeradius/3.0/clients.conf


client NAME {
  ipaddr = IPADDRESS
  secret = SECRET
}

client newClient {
  ipaddr = 192.168.2.1
  secret = testing123
}
```

Run the following on the client

```
$ radtest testing password 192.168.2.149 0 testing123
```

Test the interaction between the NAS client and the freeRADIUS server.

## Configure Secure Authentication via EAP

Create "snake oil" certs.

```
$ cd /etc/freeradius/3.0/certs
$ sudo make
```

## Create Production Certificates

[source](http://deployingradius.com/documents/configuration/certificates.html)

## Troubleshooting

```
Failed binding to auth address 127.0.0.1 port 18120 bound to server inner-tunnel: Address already in use
```

freeRADIUS is already running. `service freeradius stop`

```
Dropping packet without response because of error: Received packet from 127.0.0.1 with invalid Message-Authenticator!  (Shared secret is incorrect.)
```

The key here is: "Shared secret is incorrect."

## System Requirements

* 8MB RAM
* 100MB free HDD space
* "Minimal CPU"

## Resources

* [freeRADIUS Technical Guide](/assets/docs/freeradius-technical-guide.pdf)
