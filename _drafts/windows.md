---
layout: post
title: "Windows"
date: 2017-06-29 19:45
---

Necessity of a Windows PC: gaming, Excel, Minesweeper

## Backup

* Install WinDirStat
* Measure size of Home Folder
* Create Disc Image of Home Folder
  - < 9 GB, DVD-R
  - > 9 GB, external drive

## Verify Backup

## Determine Windows Version

[instructions](https://support.microsoft.com/en-us/help/13443/windows-which-version-am-i-running)

## Obtain Windows Key

From the admin command prompt or powershell:

```
wmic path softwarelicensingservice get OA3xOriginalProductKey
```

Or,

```
powershell "(Get-WmiObject -query ‘select * from SoftwareLicensingService’).OA3xOriginalProductKey"
```

[source](https://www.techspot.com/guides/1760-find-your-windows-product-key/)

## Obtain Windows ISO, create boot CD/USB Stick

[Windows Software Download](https://www.microsoft.com/en-us/software-download)

## Wipe Disk

## Install Windows

To eliminate viruses, install from scratch.

## Install Windows Updates

## Install Applications

* Ninite: because you can't just download anything without getting shafted with a browser toolbar.
  - Chrome
  - 7Zip
  - Notepad++
  - PuTTY
  - FileZilla
  - Some sort of virus/malware protection

## Update hosts.txt
