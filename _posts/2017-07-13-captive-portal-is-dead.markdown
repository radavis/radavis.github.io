---
layout: post
title: "Captive Portal is dead."
date: 2017-07-13 21:00
tags: networking
---

> A captive portal is a network that forces an HTTP client to see a special web
> page (usually for authentication purposes) before using the Internet normally.
> A captive portal turns a Web browser into an authentication device.

[source](https://grpugh.wordpress.com/2014/10/29/an-undocumented-change-to-captive-network-assistant-settings-in-os-x-10-10-yosemite/)

Have you ever visited an airport or coffee shop that offers pay-by-the-minute WiFi?
Usually, there are physical advertisements directing you to connect your phone or
laptop to a particular WiFi Access Point. Once connected, you might try to visit
your favorite website. If the site is secure, <https://gmail.com> for example,
you will see a "blank page". If it is insecure (<http://example.com>, note the
lack of an 's'), your web browser will be redirected to a WiFi
[Paywall](https://en.wikipedia.org/wiki/Paywall).

This is **Captive Portal** in action. The idea is to restrict what the user can do
before authentication. It uses a mechanism known as a **Man in the Middle** attack
(MITM) to hijack your web browser's request for your favorite website, and instead,
serve you a different webpage.

![Google Chrome: webpage not available](/assets/images/webpage-not-available.jpg)

The reason you saw a blank page when attempting to visit a HTTPS website was
because your browser was protecting you from potential malicious behavior.

## How does Captive Portal work?

The initial web request on a Captive Portal-enabled network will trigger a response
_only_ when a user attempts to visit a non-HTTPS website. The user must transmit
a HTTP request in clear-text over the network for a Captive Portal-enabled router
to hijack the user's request, and serve them different information. This
**highly insecure** means of restricting user access opens people up to
[all](http://http.rip/)
[sorts](https://www.troyhunt.com/ssl-is-not-about-encryption/) of
[vulnerabilities](https://arstechnica.com/tech-policy/2013/04/how-a-banner-ad-for-hs-ok/).

## What's so bad about Captive Portal?

![MITM](/assets/images/mitm.jpg)

**The user experience (UX) of a Captive Portal is very awkward**.

As a user, if I ask my web browser for the news (e.g.- <http://cnn.com>), and
get something else in return, that is not acceptable. I asked for information,
and you provided me with a paywall.

You have altered the contract of the Hypertext Transfer Protocol (HTTP) to
perform a task it should never do. I asked the server for a document. Instead, I
have been served alternative facts.

As a web technologist, this abuse of HTTP infuriates me. I'm ready to leave your
network, leave your establishment, boycott your brand, and tell everyone I know
to avoid your business.

## HTTPS: The nail in the coffin for HTTP abusers

Because HTTPS uses end-to-end encryption to keep the messages passed between your
web browser and the web server a secret (the <https://gmail.com> example),
a Captive Portal network is unable to do its thing. What happens when there are
no more plain old HTTP websites on the web to initiate Captive Portal's MITM attack?
With the movement towards
[a more secure web](https://letsencrypt.org/2014/11/18/announcing-lets-encrypt.html),
and websites such as Google giving
[HTTPS sites a higher ranking](https://webmasters.googleblog.com/2014/08/https-as-ranking-signal.html)
in search results, the number of non-secure websites is accelerating towards zero.

![Let's Encrypt 2016 Statistics](/assets/images/2016-https-cert-stats.png)

By EOY 2016, Let's Encrypt was supporting over 20M active SSL certificates (the
means by which a server can send an receive secure HTTP messages).

With this rate of change, finding an alternative to Captive Portal becomes crucial.

## Is there an alternative?

[RFC7710](https://tools.ietf.org/html/rfc7710) (released December 2015)
introduces a potential solution for allowing DCHP or Router Advertisements to
inform clients they are behind a captive portal. For the uninitiated, RFCs
document the open-standards the web is built upon. They require the adoption of
hardware and software companies to become canon. As of current (July 2017),
RFC7710 has yet to be implemented by manufacturers of networking equipment.

The idea of a Captive Portal network seems to be a poor marketing tactic at its
end-of-life.

## Where do we go from here?

As a business, you should evaluate your reasons for implementing Captive Portal
in the first place, and formulate a plan to move away from it.

**Do you want to direct your users to your brand or website?** Instead of Captive
Portal advertisements, use physical ones. People are already using your business
if they are on your WiFi. Give them an incentive to visit your online presence.

**Do you want to require visitors to pay by the hour for Wireless Internet access?**
In the era of [4G](https://en.wikipedia.org/wiki/4G)
and [LTE](https://en.wikipedia.org/wiki/LTE_(telecommunication))
cellular networks, asking someone to pay for WiFi seems uncouth.
People tend to follow the path of least resistance when it comes to getting what
they want, which means tethering their phone to their laptop, or going somewhere
else. As a business, you would be more competitive if you simply thought of
Wireless Internet as a necessity to your customers, like clean air and water, and
provided it freely via a guest network that uses WPA2 encryption
[(not WEP or WPA!)](https://www.howtogeek.com/167783/htg-explains-the-difference-between-wep-wpa-and-wpa2-wireless-encryption-and-why-it-matters/),
[content filtering](https://support.opendns.com/hc/en-us/articles/227988047-Web-Content-Filtering-and-Security),
and bandwidth restrictions.

**Do you want to lock-down your wireless network and ensure that only authenticated
users have access?** Then, deploy a Wireless network that utilizes the latest
encryption scheme (WPA2) with an authentication server, such as RADIUS. That way,
only authorized users are allow to access the network, and no one else.

## Summary

There are business benefits to offering fast, free, and secure WiFi. Feel free to
search for these articles, yourself.

The bottom line is, if you care about the users of your network, if you want to
keep your customer's data secure and their computing devices free of malware, and
you want to keep them coming back, the use of a Captive Portal network should be
eliminated.

The era of insecure data transmission is over. The hijacking of web requests through
MITM attacks and Captive Portal is no longer an acceptable practice. HTTPS is the
way forward for a more secure web.

## Resources

* [http.rip](http://http.rip/)
* [HSTS](https://en.wikipedia.org/wiki/HTTP_Strict_Transport_Security#Applicability)
* [Quora - How does a MITM attack work?](https://www.quora.com/How-does-man-in-the-middle-attack-work)
* [Airheads - Captive Portal, why do I get those certificate warnings?](http://community.arubanetworks.com/t5/Technology-Blog/Captive-Portal-why-do-I-get-those-certificate-warnings/ba-p/268921)
