---
layout: post
title: "cURL and Wget Files"
date: 2018-03-29 10:00
tags: curl wget
categories: cli
---

Both do the same thing, more or less. Use whichever your system has installed.

## Download a File

```
wget https://wiki.skullsecurity.org/images/c/ca/500-worst-passwords.txt
curl -O https://wiki.skullsecurity.org/images/c/ca/500-worst-passwords.txt
```

## Download and Rename a File

```
wget -O terrible-passwords.txt https://wiki.skullsecurity.org/images/c/ca/500-worst-passwords.txt
curl -o terrible-passwords.txt https://wiki.skullsecurity.org/images/c/ca/500-worst-passwords.txt
```

## Resources

* [Wget Manual](https://www.gnu.org/software/wget/manual/wget.html)
* [cURL Manual](https://curl.haxx.se/docs/manpage.html)
