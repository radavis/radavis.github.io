---
layout: post
title: "Clone a Folder from a GitHub Repository"
date: 2017-10-03 15:30
tags: git github
---

## Create an access token

Providing an access token allows you to avoid a user/password authentication prompt.

```
https://username:GITHUB_ACCESS_TOKEN@github.com/username/repo.git
```

## Command sequence

```
$ git init
$ git remote add origin https://username:GITHUB_ACCESS_TOKEN@github.com/username/repo.git
$ git config core.sparseCheckout true
$ echo "path/to/folder/within/repo" >> .git/info/sparse-checkout
$ git pull origin master
```
