---
layout: post
title: "OAuth, Radius, and Captive Portal"
date: 2018-03-23 11:00
tags: oauth radius captive-portal wifi
---

Is there a way to combine and capitalize upon these technologies?

## Core Idea

Business owners want to offer WiFi to customers. Customers want secure WiFi access.
Allow customers access to secure WiFi in exchange for their personal information
and opt-in to marketing emails from that business and other local businesses.

## Features

* Customer provides personal information through Google, Facebook, or Linkedin,
  then, gains Internet access.
* Business owner receives a weekly report of their customers, what they
  purchased, and the time they spent there.
* Business owner can limit customer access to WiFi for x hours per day.
* Business owner can enable Social Media integrations, which easily allow a
  returning Customer to post to Facebook, Twitter, or Google Places.
* Business owner can view a demo of the service. (Video or Personal Walkthrough)
* Business owner can schedule an installation appointment. Checklist:
  - Laptop or PC
  - Hard-wired connection to local network
  - 1 hour blocked off on calendar, preferably after-hours. What is the slowest
  time of day for your business?
* Business owner can print instructions

## Supporting Technologies

### RADIUS

A hosted RADIUS server, located at an IP address and accepting commands on a
port (1812 for auth, 1813 for accounting), accepts (1) a username,
(2) a password, (3) a shared secret as input from a RADIUS client, and returns
Accept, Reject, or Challenge.

A RADIUS client is typically a Network Access Server (NAS) such as a switch or
Wireless Access Point.

The RADIUS server may communicate either securely or insecurely with other
authentication systems.

![RADIUS Components](/assets/images/radius-components.png)

* The NAS:
  - requests network access from the RADIUS Server
  - enforces network access based on Authorization Rules set by the RADIUS Server
  - filters traffic
  - sends summaries of accounting data
* The RADIUS Server:
  - receives network access requests
  - interprets policies
  - serves data to the NAS
* The Data Store (directory or database):
  - stores data
  - user data
  - password data
  - credits
  - session data
  - etc

#### Authentication Protocols

* Password Authentication Protocol (PAP)
* Challenge-Handshake Authentication Protocol (CHAP)
* Extensible Authentication Protocol (EAP)

#### Implementations

* freeRADIUS [[link](http://freeradius.org/)] [[GPLv2](https://tldrlegal.com/license/gnu-general-public-license-v2)]
* OpenRADIUS [[link](http://sites.e-advies.nl/openradius/openradius-introduction.html)] [[GPL](http://www.gnu.org/licenses/gpl.html)]

### Captive Portal Services

#### ChilliSpot

> ChilliSpot is an open source Wireless LAN access point controller. ChilliSpot is a captive portal which authenticates users of a wireless LAN.

[Homepage](http://www.chillispot.org/features.html#mozTocId447423)

Necessary Components (hosted either locally or remotely):

* ChilliSpot
* A RADIUS Server
* A Webserver


##### Authentication Methods via ChilliSpot

* UAM - client requests IP, Chilli provides IP, client opens browser, Chilli
  captures the TCP connection and redirects the browser to an Authentication
  Web Server. The client is prompted for their credentials. Credentials are
  encrypted and sent to Chilli.
* WPA - authentication is handled by the access point, then auth data is
  forwarded to Chilli.

Both methods require a RADIUS server.

#### WiFidog

> The Wifidog project is a complete and embeddable captive portal solution for those who wish to operate a open hotspot or network of hotspots while preventing abuse of their Internet connection.

[Homepage](http://dev.wifidog.org/wiki/About)

#### NoCatSplash

> NoCatSplash is a Open Public Network Gateway Daemon.  It performs as a [captive/open/active] portal.  When run on a gateway/router on a network, all web requests are redirected until the client either logs in or clicks "I Accept" to an AUP. The gateway daemon then changes the firewall rules on the gateway to pass traffic for that client (based on IP address and MAC address).

[Homepage](https://github.com/arjan/NoCatSplash)

Seems useful for showing WiFi users a landing page. Authorization is performed
by clicking a button.

### WiFi Firmware

* [DD-WRT](https://www.dd-wrt.com/wiki/index.php/Tutorials)

## Competition

* [Sputnik](http://www.sputnik.com/)
* [JumpCloud](https://jumpcloud.com/)

## Resources

* [Create Your Own Hotspot (Using DD-WRT)](http://www.wi-fiplanet.com/tutorials/article.php/3730746/Create-Your-Own-Hotspot-Using-DD-WRT.htm)
* [Acceptable Use Policy (AUP)](https://en.wikipedia.org/wiki/Acceptable_use_policy)
* [Optware](https://en.wikipedia.org/wiki/Optware)
* [Authentication Protocols](https://community.getkisi.com/which-authentication-protocol-to-choose-ldap-kerberos-oauth2-saml-radius/)
