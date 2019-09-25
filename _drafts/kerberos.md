---
layout: post
title: "Kerberos"
date: 2018-03-27 11:45
tags: protocols security
---

> Kerberos is a computer network authentication protocol that works on the basis
> of tickets to allow nodes communicating over a non-secure network to prove
> their identity to one another in a secure manner.

> Kerberos builds on symmetric key cryptography and requires a trusted third
> party, and optionally may use public-key cryptography during certain phases of
> authentication. Kerberos uses UDP port 88 by default.

[source][1]

## Protocol

![Kerberos Protocol](/assets/images/kerberos.svg.png)

>
The client authenticates itself to the Authentication Server (AS) which forwards
the username to a key distribution center (KDC). The KDC issues a
ticket-granting ticket (TGT), which is time stamped and encrypts it using the
ticket-granting service's (TGS) secret key and returns the encrypted result to
the user's workstation. This is done infrequently, typically at user logon; the
TGT expires at some point although it may be transparently renewed by the user's
session manager while they are logged in.

[source][2]

[1]: https://en.wikipedia.org/wiki/Kerberos_(protocol)
[2]: https://en.wikipedia.org/wiki/Kerberos_(protocol)#Protocol
