---
layout: post
title: "Captive Portal is Dead. Here's why."
date: 2017-07-13 09:00
tags: networking
---

## What is it?

> A captive portal is a network that forces an HTTP client to see a special web page (usually for authentication purposes) before using the Internet normally. A captive portal turns a Web browser into an authentication device. These are commonly used on wifi networks where authentication to the private network is done via a login browser page, rather than via the use of a WEP or WPA2 key, for example in some coffee shops and airports, and hotspot providers such as The Cloud and ATT-Wifi.

[source](https://grpugh.wordpress.com/2014/10/29/an-undocumented-change-to-captive-network-assistant-settings-in-os-x-10-10-yosemite/)

Have you ever visited an airport or coffee shop that offers pay-by-the-hour WiFi?
Usually, there are physical advertisements directing you to connect your phone or
laptop to a particular WiFi Access Point. Once connected, you might try to visit
your favorite website. If the site is secure, https://gmail.com for example,
you will see a blank page. If it is insecure (http://example.com, note the lack of
an 's'), your web browser will be redirected to a paywall.


This is **Captive Portal** in action. The idea is to restrict what the user can do
before authentication. It uses a mechanism known as a **Man in the Middle** attack
(MITM) to hijack your web browser's request for your favorite website, and instead,
serve you a different webpage (a paywall).

The reason you saw a blank page when attempting to visit a HTTPS website was
because your browser was protecting you from potential malicious behavior.


## What's wrong with Captive Portal?

The user experience (UX) of Captive Portal is flawed from the start. As a user,
if I ask my browser for the news (e.g.- [CNN.com](http://cnn.com)), and get anything
else but the news in return, I'm not happy. I'm ready to leave your network,
and your establishment, for another.

Captive Portal only works when a user attempts to visit a non-HTTPS website.
Only when a user transmits a HTTP request in clear-text over the network is a
Captive Portal-enabled router able to hijack the user's request, and serve them
different information. This highly insecure means of restricting user access opens
people up to
[all](http://http.rip/)
[sorts](https://www.troyhunt.com/ssl-is-not-about-encryption/) of
[vulnerabilities](https://arstechnica.com/tech-policy/2013/04/how-a-banner-ad-for-hs-ok/).

Because HTTPS uses end-to-end encryption to keep the messages passed between the
client (your web browser) and the server a secret, a Captive Portal enabled device
is unable to do its thing. What happens when there are no more insecure websites
on the web? With the movement towards
[a more secure web](https://letsencrypt.org/2014/11/18/announcing-lets-encrypt.html),
the number of non-secure websites is moving towards zero.

Finding an alternative to Captive Portal becomes crucial.

## Where do we go from here?

[RFC7710](https://tools.ietf.org/html/rfc7710) (released December 2015)
introduces a potential solution for allowing DCHP or Router Advertisements to
inform clients they are behind a captive portal. However, this specification has
yet to be adopted by manufacturers of networking equipment.

The idea of Captive Portal seems to be at an end.

This spurs the question, what do we do now? As a business, you should
evaluate your reasons for implementing Captive Portal in the first place, and
formulate a plan to move away from it.

Do you want to require visitors to pay by the hour for Wireless Internet access?
In the era of [4G](https://en.wikipedia.org/wiki/4G)
and [LTE](https://en.wikipedia.org/wiki/LTE_(telecommunication))
cellular networks, asking someone to pay for WiFi when they can easily access
the Internet via their phone seems silly. People tend to follow the path of least
resistance when it comes to getting what they want, which means tethering their
phone to their laptop, or going somewhere else. As a business, you would be more
competitive if you simply thought of Wireless Internet as a necessity to your
customers, like water or clean air, and provided it freely via a guest network that has
[content filtering](https://support.opendns.com/hc/en-us/articles/227988047-Web-Content-Filtering-and-Security)
and bandwidth restrictions.

Do you want to lock-down your wireless network and ensure that only authenticated
users have access? Then, deploying a Wireless network that utilizes the latest
encryption scheme (WPA2) with an authentication server, such as RADIUS, is the way to go.

## Summary

The bottom line is, if you care about the users of your network, if you want to
keep their data secure and computing devices free of malware, use of a Captive
Portal on your network should be eliminated.

The era of insecure data transmission is over. HTTPS is the way forward for a secure web.

## Resources

Want to read more on this subject. Check out these resources:

* [http.rip](http://http.rip/)
* [HSTS](https://en.wikipedia.org/wiki/HTTP_Strict_Transport_Security#Applicability)
* [Quora - How does a MITM attack work?](https://www.quora.com/How-does-man-in-the-middle-attack-work)
* [Airheads - Captive Portal, why do I get those certificate warnings?](http://community.arubanetworks.com/t5/Technology-Blog/Captive-Portal-why-do-I-get-those-certificate-warnings/ba-p/268921)
* [Meraki - Wireless Encryption and Authentication Overview](https://documentation.meraki.com/MR/Encryption_and_Authentication/Wireless_Encryption_and_Authentication_Overview)
