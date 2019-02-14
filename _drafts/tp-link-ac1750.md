# TP-LINK Archer C7 AC1750


## Specs

[official specs](https://www.tp-link.com/us/products/details/cat-9_Archer-C7.html#specifications)

[openwrt techdata](https://openwrt.org/toh/hwdata/tp-link/tp-link_archer_c7_ac1750_v2.0)

* CPU MHz: 720
* Flash MB: 16
* RAM MB: 128
* Firmware Version:	3.15.3 Build 180114 Rel.39265n
* Hardware Version:	Archer C7 v2 00000000

## Connecting

* username/password: admin/admin
* ip: 192.168.0.1


## Installing OpenWrt

### 1st Attempt

> Error code: 18005
> Upgrade unsuccessfully because the version of the upgraded file was incorrect.
> Please check the file name.

### 2nd Attempt: FriedZombie TP-LINK Stripped Firmware

[source](https://www.friedzombie.com/tplink-stripped-firmware/)

[forum](https://forum.openwrt.org/t/solved-archer-c7-v2-firmware-version-3-15-1-cannot-install-help/11663/3)

> Error code: 18005

### 3rd Attempt: dd-wrt

[source](https://dd-wrt.com/support/router-database/)

> Error code: 18005

### 4th Attempt: Downgrade (Partial Success)

[source](https://www.tp-link.com/us/download/Archer-C7_V2.html#Firmware)

> Firmware Version: 3.15.1 Build 160719 Rel.57530n

* Attempt openwrt-18.06.2-ar71xx -> Error code: 18005
* Attempt FriedZombie TP-LINK Stripped Firmware -> Error code: 18005
* Attempt dd-wrt -> Error code: 18005

### 5th Attempt: TFTP (Success!)

* set server IP (with sudo)
  - `ifconfig en5 inet 192.168.0.66 netmask 255.255.255.0`
  - `ifconfig en5 down`
  - `ifconfig en5 up`
* filename: `ArcherC7v2_tp_recovery.bin`
* set permissions for `/var/tftpboot`
* Start tftp
  - `sudo launchctl load -F /System/Library/LaunchDaemons/tftp.plist`
* Is tftp up?
  - `netstat -na |grep \*.69`
* Hold WPS/Reset Button while connecting power
* WAIT! Watch LEDs. Scan WiFi for `OpenWrt`
* Try connecting to web admin panel at `192.168.1.1`
* Stop tftp
  - `sudo launchctl unload -F /System/Library/LaunchDaemons/tftp.plist`
* Return IP settings to DCHP:
  - `ifconfig en5 delete 192.168.0.66`
  - `ipconfig set en5 DHCP`

[source](https://rick.cogley.info/post/run-a-tftp-server-on-mac-osx/)
