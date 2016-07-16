---
layout: post
title: "Raspberry Pi Web Kiosk"
date: 2015-04-11 12:44
tags: raspberry-pi raspbian debian
comments: true
---

# Raspberry Pi Kiosk

Instructions to go from zero to a Raspberry Pi Kiosk displaying a webpage with auto-refresh.

* OS: Raspbian (Debian Wheezy) 2015-02-16
* Browser: IceWeasel

## Copy Raspbian to a SD Card (on OSX)

[Instructions](http://elinux.org/RPi_Easy_SD_Card_Setup) for other OSes.

* [Download Raspbian](https://www.raspberrypi.org/downloads/)
* Plug in SD Card (>= 4GB)
* Open up the terminal

```
$ diskutil list
$ diskutil unmountDisk /dev/disk#
$ sudo dd bs=1m if=<raspbian-image-file> of=/dev/rdisk#
```
__Note__: The `'r'` in `/dev/rdisk#` is not a typo. This is the raw path to the disk, which is [faster than the buffered `/dev/disk` devices](http://superuser.com/questions/631592/why-is-dev-rdisk-about-20-times-faster-than-dev-disk-in-mac-os-x).

## Power it up

* Hook up your Pi: Plug in the mouse, keyboard, monitor, ethernet, sd card, and power.
* First boot will take you to the `raspi-config` utility:
  - Expand the filesystem
  - Change the user password from the default (user: pi, pass: raspberry)
  - Enable boot to graphical desktop
  - I18n options -> Change keyboard layout -> Select your keyboard
  - Finish and reboot

## Install xscreensaver and Disable the Screen Saver

```
sudo apt-get update
sudo apt-get install xscreensaver
```

Menu -> Preferences -> Screensaver -> Display Mode -> Disable Screen Saver

## Launch IceWeasel on Startup

```
$ sudo apt-get update
$ sudo apt-get install iceweasel
$ sudo nano /etc/xdg/lxsession/LXDE-pi/autostart
```

##### /etc/xdg/lxsession/LXDE-pi/autostart

```
@iceweasel
```

## Install IceWeasel Add-ons

* [FF Fullscreen](https://addons.mozilla.org/en-us/firefox/addon/FF_Fullscreen/)
* [ReloadEvery](https://addons.mozilla.org/en-us/firefox/addon/reloadevery/)

## Configure the Browser

* Right-click on page -> ReloadEvery -> Auto Enable New Tab
* Set your homepage in the Preferences
