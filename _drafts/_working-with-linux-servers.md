# Working with Linux Servers

[[source](https://opensource.com/article/20/12/linux-server)]

What OS are we using? What is the hostname of this machine? How long has this server been running? 

```bash
$ cat /etc/os-release
$ uname -a
$ hostnamectl
$ uptime
```

Which other users are on this server? Which other users have shell access?

```bash
$ who -Hu
$ grep sh$ /etc/passwd
```

Is this a physical machine or virtual machine?

```bash
$ dmidecode -s system-manufacturer
$ dmidecode -s system-product-name
$ cat /sys/class/dmi/id/sys_vendor
$ cat /sys/class/dmi/id/product_name
```

```bash
$ lscpu # or
$ cat /proc/cpuinfo
$ lsmem # or
$ cat /proc/meminfo
$ ifconfig 
```

```bash
$ inxi -F
```
