---
layout: cheatsheet
title: "sudoers"
date: 2018-02-11 11:05
tags: bash unix cheatsheet
---

## Edit the sudoers file

`sudo nano /etc/sudoers`

## Allow user pi to run commands as su without typing a password

```
pi ALL=(ALL) NOPASSWD: ALL
```
