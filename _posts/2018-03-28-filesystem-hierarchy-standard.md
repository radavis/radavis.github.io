---
layout: post
title: "Filesystem Hierarchy Standard"
date: 2018-03-28 17:00
tags: unix
---

Where should that file go in the \*nix filesystem?

## FHS v2.3

| Directory | Description |
| --------- | ----------- |
| bin       | essential binaries |
| boot      | boot loader |
| dev       | device files |
| etc       | host-specific system configuration |
| home      | user home directories (optional) |
| lib       | shared libraries/kernel modules |
| media     | removable media mount point |
| mnt       | temporary filesystem mount point |
| opt       | add-on software packages |
| root      | home directory for the root user (optional) |
| sbin      | essential system binaries |
| srv       | data for services provided by this system |
| tmp       | temporary files |
| usr       | secondary hierarchy |
| var       | variable data |

[source](http://www.pathname.com/fhs/pub/fhs-2.3.pdf)
