---
layout: post
title: "Making cURL requests to a host with a Self-Signed Certificate"
date: 2018-03-20 13:00
tags: curl
categories: cli
---

[Get the cert][1]

```
$ openssl s_client -showcerts \
    -servername hostname.com \
    -connect hostname.com:443 \
    > hostname-cacert.pem
```

Use the cert and [print everything][2]

```
$ curl --cacert hostname-cacert.pem \
    --verbose \
    https://hostname.com/...
```

[1]: https://stackoverflow.com/a/27611319/2675670
[2]: https://ec.haxx.se/usingcurl-verbose.html
