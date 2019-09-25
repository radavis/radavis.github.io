## ONE MAJOR ISSUE

The Raspberry Pi architecture is ARM. Printer manufacturers rarely care about
building drivers and balk at releasing source code (a thought pattern that
triggered the creation of the FSF).

Linux packages for the HL-L2320D are available for RedHat and Debian/Ubuntu i386
architecture, but **not** for the ARM release of Debian (Raspbian).

## A Better Solution

Plug your USB Printer into a Router running OpenWRT and p910nd Print Server.

[source](https://openwrt.org/docs/guide-user/services/print_server/p910ndprinterserver)

## Update Linux

```
$ sudo apt-get update
$ sudo apt-get upgrade
```

## Install Common UNIX Printing System (CUPS)

[wiki](https://en.wikipedia.org/wiki/CUPS)

```
$ sudo apt-get install cups
```

### Configure CUPS

```
$ sudo usermod -a -G lpadmin pi  # add pi user to CUPS admin group (lpadmin)
$ sudo cp /etc/cups/cupsd.conf /etc/cups/cups.conf.default
$ sudo nano /etc/cups/cupsd.conf
```

```
# /etc/cups/cupsd.conf
# Listen localhost:631  # open service to requests from the local machine
Port 631  # open service to network

# allow local connections to the different paths in the web interface
<Location />
  Order allow, deny
  Allow @local
</Location>

<Location /admin>
  Order allow, deny
  Allow @local
</Location>

...
```

Open network traffic (for the current session?)

```
$ sudo cupsctl --remote-any
$ sudo /etc/init.d/cups restart
```

### Add Printer...

...through the CUPS web interface on port 631

### Open Port 631 for TCP/UDP, if necessary

```
$ sudo iptables -A INPUT -i eth0 -p tcp -m tcp --dport 631 -j ACCEPT
$ sudo iptables -A INPUT -i eth0 -p udp -m udp --dport 631 -j ACCEPT
```

## Enable Windows Printer Access through Samba

```
$ sudo apt-get install samba
$ nano /etc/samba/smb.conf
```

```
# /etc/samba/smb.conf
# set 'workgroup' parameter to your windows workgroup (default: WORKGROUP)
guest ok = yes
path = /usr/share/cups/drivers
wins support = yes
```

## Enable AirPrint for Apple Devices

```
$ sudo apt-get install avahi-daemon
```

### References
