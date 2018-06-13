# Configuring Your Raspberry Pi

1. [x] Download and Extract a Disk Image
1. [x] [Write disk image](https://elinux.org/RPi_Easy_SD_Card_Setup#Create_your_own)
1. [x] Turn on SSH: `touch /boot/ssh`
1. [x] Setup WiFi: `touch /boot/wpa_supplicant.conf`
1. [x] Install the SD Card and boot the Pi
1. [x] Find the Pi on the Network (by IP)
1. [x] Run `raspi-config`
1. [x] Change Password
1. [x] Set Pi Hostname
1. [x] Copy SSH Key
1. [x] Disable SSH Password Logins
1. [x] Set the locale
1. [x] Update the OS

## Disk Images

* [Raspbian](https://www.raspberrypi.org/downloads/raspbian/)
* [RetroPie](https://retropie.org.uk/download/)
* [Screenly](https://www.screenly.io/ose/)
* [OSMC](https://osmc.tv/download/)

```
$ wget https://github.com/RetroPie/RetroPie-Setup/releases/download/4.3/retropie-4.3-rpi2_rpi3.img.gz
$ gunzip retropie-4.3-rpi2_rpi3.img.gz
```

## wpa_supplicant.conf

```
country=US
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1

network={
    ssid="your-ssid"
    scan_ssid=1
    psk="your-wifi-password"
    key_mgmt=WPA-PSK
}

network={
    ssid="another-ssid"
    scan_ssid=1
    psk="wifi-password"
    key_mgmt=WPA-PSK
}
```

[source](https://raspberrypi.stackexchange.com/a/57023)

## Find the Pi on the Network

Determine the Pi's Hostname and IP Address.

[Using nmap or fing](https://radavis.github.io/2018/03/23/finding-devices-on-your-local-network.html)

```
$ ping my-cool-pi-hostname.local
```

## Run `raspi-config`

```
$ ssh pi@my-cool-pi-hostname.local  # default password is 'raspberry'
pi@retropie:~ $ sudo raspi-config
```

Set the password, hostname, and localization options.

## hostnames

> Valid characters for hostnames are ASCII(7) letters from a to z, the digits
> from 0 to 9, and the hyphen (-).  A hostname may not start with a hyphen.

[source](http://man7.org/linux/man-pages/man7/hostname.7.html)


After booting: SSH into the Pi and set the hostname through the `raspi-config` menu or by setting `/etc/hostname`.

[StackExchange Answer](https://raspberrypi.stackexchange.com/a/44963)


## Change Password

```
$ passwd
```


## Copy SSH Key

```
$ ls ~/.ssh  # check for keys
```

[Generate keys](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/)
if `id_rsa` & `id_rsa.pub` do not exist.


```
$ ssh-copy-id -i ~/.ssh/id_rsa.pub pi@my-cool-pi-hostname
$ ssh-copy-id -i ~/.ssh/id_rsa.pub pi@192.168.1.250
```

[source](https://www.raspberrypi.org/documentation/configuration/security.md)


## Disable SSH Password Logins

```
$ sudo nano /etc/ssh/sshd_config
```

Add `PasswordAuthentication no` and save.

```
$ sudo service ssh reload
```

## Set the locale

```
$ sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
```

[source](https://askubuntu.com/a/505424)

## Set the Keyboard Layout

## Change the Wi-fi Country

## Set Wi-fi w/ wicd

```
$ sudo apt-get install wicd wicd-curses
$ wicd-curses
```

## Areas to Improve

* Pi Zero and Wifi connections
* Pi Zero and HDMI resolution


## What's Next?

* Ping Google: `ping google.com`
* Update the OS: `sudo apt-get update && sudo apt get upgrade`
* Copy files with `scp`

## Resources

* [Awesome Raspberry Pi](https://github.com/thibmaek/awesome-raspberry-pi)
