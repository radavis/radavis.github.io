## Wifi Adapter Journey

```
$ sudo dd if=RetrOrangePi_4.2_FULL_Armbian_5.59_Retrostone_Debian_jessie_default_3.4.113_desktop.img of=/dev/rdisk2 bs=4m && sync
$ ssh pi@RetrOrangePi
$ sudo apt update && sudo apt upgrade
$ sudo reboot
$ ssh pi@RetrOrangePi
$ sudo apt install linux-headers-sun8i
$ cd ~
$ git clone https://github.com/pvaret/rtl8192cu-fixes.git
$ cd rtl8192cu-fixes/
$ make ARCH=arm
$ sudo insmod 8192cu.ko
$ dmesg
$ sudo iwlist wlan3 scan
# wlan3 can scan, but cannot connect
```

* <https://docs.armbian.com/User-Guide_Advanced-Features/#how-to-build-a-wireless-driver>


[source](https://forum.armbian.com/topic/2892-module-8192cuko-not-working-in-armbian-514/?do=findComment&comment=20665)

```
$ sudo dd if=RetrOrangePi_4.2_FULL_Armbian_5.59_Retrostone_Debian_jessie_default_3.4.113_desktop.img of=/dev/rdisk2 bs=4m && sync
$ ssh pi@RetrOrangePi
$ sudo apt install dkms linux-headers-sun8i
$ git clone https://github.com/pvaret/rtl8192cu-fixes.git
$ sudo dkms add ./rtl8192cu-fixes
$ sudo dkms install 8192cu/1.11
$ sudo depmod -a
$ sudo cp ./rtl8192cu-fixes/blacklist-native-rtl8192.conf /etc/modprobe.d/
$ sudo reboot

$ ssh pi@RetrOrangePi
$ sudo iwlist wlan3 scan
$ sudo -s
# wpa_passphrase "Your WiFi SSID" >> /etc/wpa_supplicant/wpa_supplicant.conf  # then, type password
# exit
$ sudo wpa_cli -i wlan3 reconfigure  # -> FAIL
$ sudo ifconfig wlan3 down && sudo ifconfig wlan3 up
$ sudo ifconfig
...
wlan3     Link encap:Ethernet  HWaddr 80:1f:02:7e:83:72
          UP BROADCAST MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:7 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
```

wlan3 is dropping packets... wtf.


```
$ sudo dd if=RetrOrangePi_4.2_FULL_Armbian_5.59_Retrostone_Debian_jessie_default_3.4.113_desktop.img of=/dev/rdisk2 bs=4m && sync

$ ssh pi@RetrOrangePi
$ sudo apt update && sudo apt upgrade
$ sudo reboot  # then, shutdown

$ sudo dd if=/dev/rdisk2 of=RetrOrangePi_4.2_Full_Armbian_5.59-updated.img bs=4m && sync

$ sudo ifconfig
$ sudo ifconfig wlan3 down
$ sudo ifconfig wlan3 up
```

Search: `rtl8188cus armbian`

Just do this: <https://forum.armbian.com/topic/1237-opi-one-wireless-success/>

```
$ sudo nmtui  # 'Activate a connection' -> Select WiFi SSID, enter password. Done.
$ hostname -I
```


## Fucking Pitfalls

* https://docs.armbian.com/User-Guide_Advanced-Features/#how-to-build-a-wireless-driver
* https://forum.armbian.com/topic/1770-orange-pi-pc-wireless-rtl8188cus/
* https://forum.armbian.com/topic/749-orange-pi-pc-wireless-module-8192cu/
* https://www.linux.com/learn/how-configure-wireless-any-linux-desktop
* https://wiki.archlinux.org/index.php/WPA_supplicant
