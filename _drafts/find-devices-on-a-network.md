# Find Devices on a Network

## Determine your local IP

[source](https://www.linuxtrainingacademy.com/determine-public-ip-address-command-line-curl/)

```
$ ifconfig en0
$ ifconfig | grep inet
$ hostname -I
```

```
$ sudo nmap -sP 10.10.10.0/24
Password:
Starting Nmap 7.70 ( https://nmap.org ) at 2019-02-02 20:14 EST
Nmap scan report for router.redcrab (10.10.10.1)
Host is up (0.0023s latency).
MAC Address: 84:C9:B2:54:C5:CD (D-Link International)
Nmap scan report for adblock.redcrab (10.10.10.2)
Host is up (0.0031s latency).
MAC Address: B8:27:EB:DF:10:07 (Raspberry Pi Foundation)
Nmap scan report for kingwin.redcrab (10.10.10.118)
Host is up (0.030s latency).
MAC Address: 00:1D:60:34:5F:CC (Asustek Computer)
Nmap scan report for 10.10.10.121
Host is up (0.20s latency).
MAC Address: 40:99:22:FA:55:A1 (AzureWave Technology)
Nmap scan report for RetrOrangePi.redcrab (10.10.10.126)
Host is up (0.0032s latency).
MAC Address: 80:1F:02:7E:83:72 (Edimax Technology)
Nmap scan report for 10.10.10.139
Host is up (0.0058s latency).
MAC Address: 80:1F:02:7E:83:72 (Edimax Technology)
Nmap scan report for cookbook.redcrab (10.10.10.211)
Host is up (0.17s latency).
MAC Address: 88:53:95:0E:6E:51 (Apple)
Nmap scan report for stream.redcrab (10.10.10.215)
Host is up (0.11s latency).
MAC Address: 48:D6:D5:31:B4:88 (Google)
Nmap scan report for files.redcrab (10.10.10.216)
Host is up (0.0041s latency).
MAC Address: 00:11:32:61:3D:61 (Synology Incorporated)
Nmap scan report for motog5.redcrab (10.10.10.217)
Host is up (0.11s latency).
MAC Address: F0:D7:AA:81:CE:D0 (Motorola Mobility, a Lenovo Company)
Nmap scan report for mbp.redcrab (10.10.10.214)
Host is up.
Nmap done: 256 IP addresses (11 hosts up) scanned in 2.76 seconds
```

* Select mac, hostname, ip from nmap output

```

```
