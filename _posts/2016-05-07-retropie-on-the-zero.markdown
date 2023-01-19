---
layout: post
title: "RetroPie on the Zero"
date: 2016-05-07 19:00
tags: raspberry-pi linux hardware
categories: raspberry-pi
comments: true
---

![retro-pie](/assets/images/retro-pie.jpg)

I don't have much time for gaming these days. Most of my time is dedicated to coding, or teaching. When I do have a free moment, I love firing up a classic game and racking up some points.

Here are some of my favorites:

* [Pengo](http://www.arcade-museum.com/game_detail.php?game_id=8989) (arcade)
* [Tetris](https://en.wikipedia.org/wiki/Tetris_(Atari)) (NES, Atari/Tengen)
* [BurgerTime](http://www.classicgaming.cc/classics/burgertime/)
* [Lode Runner](https://en.wikipedia.org/wiki/Lode_Runner) (arcade)
* [Robotron 2084](https://en.wikipedia.org/wiki/Robotron:_2084) (arcade)

There is something to be said about the simplicity and engagement of older games. They may not tell a story like the epic titles of today, but you can pick them up, get some enjoyment out of them for awhile, and then get back to life.

I recently threw together some hardware for the purpose of rediscovering (and discovering) some classics.

## This is my retro-gaming hardware.

![Raspberry Pi Zero and 8bitdo SFC30 Controller](/assets/images/pi-zero.png)

My PC from the late 90s didn't have this much power, and was about 500x times larger.

| Product |
| ------- |
| [Raspberry Pi Zero](https://www.raspberrypi.org/products/pi-zero/) |
| 4GB (or greater) microSD card |
| 2x [8bitdo SFC30 Controllers](http://8bitdo.com/sfc30/) |
| [MakerSpot USB Hub](http://makerspot.com/stackable-usb-hub-for-raspberry-pi-zero/) |
| Edimax EW-7811Un WiFi Adapter |
| Bluetooth Adapter |
| 5V@2A Adapter |
| miniHDMI to HDMI cable |

<br />

[Amazon link](https://www.amazon.com/gp/registry/wishlist/A9W6UVBXLQZ4/ref=cm_wl_list_o_2?) to most of these products, minus the Pi Zero, the SD card, and the [MakerSpot USB Hub](http://makerspot.com/stackable-usb-hub-for-raspberry-pi-zero/). I assume you probably have a microSD card lying around, or that you would like to choose the amount of storage you have at your disposal.

**Note:** The Pi Zero is hard to come by right now. I've had decent luck finding them at my local [MicroCenter](http://www.microcenter.com/). The [RaspberryPi](https://www.raspberrypi.org/products/pi-zero/) website lists other retailers who should have them in stock.

Of course, you don't have to purchase a Zero to have this setup. There are [plenty other flavors of the Raspberry Pi](https://www.raspberrypi.org/products/) that will run this combination of hardware and software.

## RetroPie

[RetroPie](https://retropie.org.uk/) is a Linux distro for the Raspberry Pi that includes emulators for practically every piece of gaming hardware released before 1999. To set things up, copy an image of the RetroPie OS to your microSD card, do a bit of configuring, and you're on your way.

Here are my notes:

## Setting Up EmulationStation/RetroPie on a PiZero

![retro-pie splash screen](/assets/images/retro-pie-darkgrey.png)

### Installation (on OS X)

[Download](https://retropie.org.uk/download/)

```
$ wget https://github.com/RetroPie/RetroPie-Setup/releases/download/3.7/retropie-v3.7-rpi1_zero.img.gz
$ gunzip retropie-v3.7-rpi1_zero.img.gz
$ diskutil list
$ diskutil unmountDisk /dev/disk1
$ sudo dd if=retropie-v3.7-rpi1_zero.img of=/dev/rdisk1 bs=1m
$ sync
```

### Enable ssh

```
$ sudo raspi-config
```

* Select '9 Advanced Options'
* Select 'A4 SSH'
* Select 'Enable'

While here, set the Internationalization and Keyboard options, too.

### Connect via ssh

Typically, the default credentials are username: `pi`, password: `raspberry`.

```
$ ssh pi@retropie.local
```

### Shutdown

```
$ sudo shutdown now
```

### Reboot

```
$ sudo reboot
```

### Mass convert .7z files to .zip using atool

The [RetroPie documentation](https://github.com/RetroPie/RetroPie-Setup/wiki/Supported-Systems) indicates the file formats supported by each emulator. `.zip` files are supported by most, if not all, emulators.

```
$ arepack -e --format=zip *.7z
```

[Source](http://web.archive.org/web/20130208164402/http://www.expertslogin.com/linux-administration/extracts-files-archive-atool-utility/)

### Mass extract .7z files

```
$ ls *.7z | parallel -j+0 --eta '7z x {} >/dev/null'
```

### Mass compress files

```
$ find . -type f -exec zip '{}.zip' '{}' \;
```

faster

```
$ ls *.nes | parallel -j+0 --eta 'zip {}.zip {} >/dev/null'
```

[Source](http://stackoverflow.com/a/17771205/2675670)

### Copy files via scp

```
$ scp ~/Downloads/nes/*.zip pi@retropie.local:~/RetroPie/roms/nes
```

### Configure RetroPie via ssh

```
$ ssh pi@retropie.local
$ cd ~/RetroPie-Setup
$ sudo ./retropie_setup.sh
```

### Automatically Connect to WPA2 Wireless

```
$ sudo nano /etc/network/interfaces
```

```
auto lo

iface lo inet loopback
iface eth0 inet dhcp

allow-hotplug wlan0
auto wlan0
iface wlan0 inet dhcp
   wpa-ssid "NETWORK_NAME"
   wpa-psk "NETWORK_PASSWORD"

wireless-power off
```

```
$ sudo ifdown wlan0
$ sudo ifup wlan0
```

[Source](https://github.com/retropie/retropie-setup/wiki/Wifi#method-2-interfaces)

### Automatically Connect to Bluetooth Controllers (8Bitdo SFC30 GamePads)

Hold `Start+R` to power controllers on in Joystick mode.

Register the controllers with the `~/RetroPie-Setup/retropie_setup.sh` script.

```
$ sudo bluetoothctl
```

Follow the instructions, [here](https://github.com/retropie/retropie-setup/wiki/setting-up-a-bluetooth-controller)

### HDMI Audio

```
$ sudo nano /boot/config.txt
```

```
hdmi_drive=2
hdmi_force_hotplug=1
hdmi_force_edid_audio=1
```

[Source](http://elinux.org/R-Pi_Troubleshooting#Sound)

### Resources

* [MAME ROMs on archive.org](https://archive.org/details/messmame)
* [Full romsets on EmuParadise][1]

## Wrap Up

This isn't by any means a full step-by-step guide. Part of the fun of this is gathering the hardware and figuring out how to set it all up. Hopefully, the information here will put you on the right track.

If you are looking for more info, check out the following resources.

* [RetroPie Wiki](https://github.com/RetroPie/RetroPie-Setup/wiki)
* [RetroPie Fourm](https://retropie.org.uk/forum/)
* [/r/RetroPie](https://www.reddit.com/r/retropie)

[1]: http://www.emuparadise.me/Complete_ROM_Sets_(Full_Sets_in_One_File)_ROMs/List-All-Titles/37
