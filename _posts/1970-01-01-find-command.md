---
layout: post
title: "find"
categories: cheatsheet
---

## Find and delete files from 5 minutes ago

```
$ find . -cmin 5
$ find . -cmin 5 -delete
```

## Remove all `.DS_Store` files

```
$ find / -name .DS_Store -delete
```

## Resources

* <https://unix.stackexchange.com/questions/167823/find-exec-rm-vs-delete>
* <https://www.quora.com/How-do-you-select-files-by-date-modified-in-UNIX-Linux>
