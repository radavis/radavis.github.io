https://andrewwippler.com/2016/03/11/wifi-captive-portal/

Install Debian/Raspian.

```
$ sudo apt-get install \
    iptables-persistent \
    conntrack \
    dnsmasq \
    nginx \
    php5 php5-common php5-fpm \
    hostapd
```

## dnsmasq

DNS/DHCP server.

```
# dnsmasq.conf
bogus-priv
server=/localnet/192.168.24.1
local=/localnet/
interface=wlan0
domain=localnet
dhcp-range=192.168.24.50,192.168.24.250,2h
dhcp-option=3,192.168.24.1
dhcp-option=6,192.168.24.1
dhcp-authoritative
```

```
# Contents of /etc/hosts
127.0.0.1	localhost
192.168.24.1	hotspot.localnet
::1		localhost ip6-localhost ip6-loopback
fe00::0		ip6-localnet
ff00::0		ip6-mcastprefix
ff02::1		ip6-allnodes
ff02::2		ip6-allrouters
```

```
# Contents of /etc/network/interfaces
# The loopback network interface
auto lo eth0
iface lo inet loopback

# The "wan" network interface
iface eth0 inet dhcp

# The "lan" network interface
iface wlan0 inet static
  address 192.168.24.1
  netmask 255.255.255.0
```

## hostapd

WAP software. Broadcasts SSID over WiFi.

```
# /etc/hostapd/hostapd.conf
interface=wlan0
ssid=MyOpenAP # name of the WiFi access point
hw_mode=g
channel=6 #use 1, 6, or 11
auth_algs=1
wmm_enabled=0
```

```
# /etc/default/hostapd
DAEMON_CONF="/etc/hostapd/hostapd.conf"
```

## iptables

Firewall. Blocks unauthorized connections.
