---
layout: post
title: "Toggle WiFi with Hotkeys in OSX"
date: 2014-12-18 15:36
tags: osx bash hotkeys
categories: macOS
comments: true
---

```
#!/bin/bash

ADAPTER="en0"
WIFI=`/usr/sbin/networksetup -getairportpower $ADAPTER | awk '{ print $NF }'`

if [ "$WIFI" = "On" ]
then
  `/usr/sbin/networksetup -setairportpower $ADAPTER off`
else
  `/usr/sbin/networksetup -setairportpower $ADAPTER on`
fi
```

# Instructions

* Open up Automator
* Create a new Service
* Double-click 'Run Shell Script'
* Select 'no-input' from 'Serivce receives'
* Input the shell script above and save it
* Replace the adapter with the name of your WiFi adapter. This can be found by running `ifconfig`.
* System Preferences -> Keyboard -> Shortcuts
* Under 'General', set a Hotkey for toggling the WiFi adapter. Mine is `Control + Option + Command + W`.
