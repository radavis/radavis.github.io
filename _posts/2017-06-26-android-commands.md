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
$ rm -r /data/dalvik-cache
```

## Copy files from Android device to local storage

```no-highlight
$ adb pull /storage/292A-0FE1/Music/* /Volumes/128GB_MSD/music
```

## Sync files between devices

```no-highlight
$ adb push --sync /Volumes/128GB_MSD/music /storage/292A-0FE1/Music
```

* [x] Movies
* [x] Downloads
* [x] Pictures
