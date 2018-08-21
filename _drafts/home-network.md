## Home Network

ssid: Horrid Rare Red Crab
password: 414waterstreetunit2005

## Machines & Static Leases

How does DHCP negotiate static vs assignable IP?

dd-wrt -> Services -> DHCP Server/Static Leases

mac               | hostname | ip            | device
84:C9:B2:54:C5:CD | router   | 10.10.10.1    | D-Link DIR-615 (DD-WRT)
b8:27:eb:df:10:07 | adblock  | 10.10.10.2    | Raspberry Pi Model (Pi-hole)
88:53:95:0e:6e:51 | cookbook | 10.10.10.211  | Apple iPad 2 MC769LL/A
(repurpose) 74:DA:38:68:F4:D3 | print    | 10.10.10.212  | Raspberry Pi Model B (Rev. 000e), Brother HL-L2320D
6c:40:08:b2:65:96 | mbp      | 10.10.10.214  | Apple MacBookPro11,2 MGXA2xx/A
48:D6:D5:31:B4:88 | stream   | 10.10.10.215  | Google Chromecast 2nd Generation
00:11:32:61:3d:61 | files    | 10.10.10.216  | Synology DS216J NAS 3TB RAID1
F0:D7:AA:81:CE:D0 | motog5   | 10.10.10.217  | Motorola G5 Plus Phone
e4:83:99:76:3b:2a | modem    | 192.168.100.1 | Motorola SB5101U Cable Modem

## Web Portals

* [DD-WRT Router](http://router.redcrab:80/admin/)
* [Pi-hole](http://adblock.redcrab:80/admin/)
* ~[CUPS](http://10.10.10.212:631)~
* [Synology DiskStation](http://files.redcrab:5000/)
* [Cable Modem](http://modem.redcrab:80/)


armhf

http://download.brother.com/welcome/dlf101909/hll2320dcupswrapper-3.2.0-1.i386.deb
http://download.brother.com/welcome/dlf101909/hll2320dcupswrapper-3.2.0-1.armhf.deb
