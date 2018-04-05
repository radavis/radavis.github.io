---
layout: post
title: "Android Commands"
date: 2017-06-26 20:30
tags: bash android
categories: cli
---

## Install Android Command Line Tools

```no-highlight
$ brew cask install android-platform-tools
```

[link](https://stackoverflow.com/a/32314718)

## List Devices

```no-highlight
$ adb devices
```

## CLI Access

```no-highlight
$ adb shell
```

## Backup

```no-highlight
$ adb backup -apk -noshared -all ~/Documents/android-backup-20170504.ab
```

## Restore

```no-highlight
$ adb restore ~/Documents/android-backup-20170504.ab
```

## Clear Cache

```no-highlight
rm -r /data/dalvik-cache
```
