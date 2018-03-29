---
layout: post
title: "Service Name and Corresponding TCP Port"
date: 2018-03-29 8:00
tags: ports tcp
---

These are documented by the [Service Name and Transport Protocol Port Number
Registry][1].

| Port | Service |
| ---- | ------- |
| 21   | FTP     |
| 22   | SSH     |
| 25   | SMTP    |
| 37   | time    |
| 42   | nameserver |
| 43   | nicname |
| 53   | DNS     |
| 80   | HTTP    |
| 88   | kerberos |
| 110  | POP3    |
| 389  | LDAP    |
| 443  | HTTPS   |


## Port Ranges

* System Ports (0-1023)
* User Ports (1024-49151)
* Dynamic/Private Ports (49152-65535)

[source][2]


[1]: https://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.xhtml
[2]: https://tools.ietf.org/html/rfc6335#section-6
