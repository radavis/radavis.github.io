## Install Optional Binary Packages for MSX Emulators

```
$ cd ~/RetroPie-Setup
$ sudo ./retropie-setup.sh
```

Install `lr-bluemsx`, `lr-fmsx`, and/or `OpenMSX`.

## Get BIOS System ROM Files

**Note**: This step seems unnecessary for OpenMSX usage.

```
$ wget https://www.msxinfo.net/files/systemroms.zip
$ unzip systemroms.zip -d ~/.openMSX/share
```

## Problem: Games Won't Launch

Inspect the result of calling the emulator from the launcher.

```
$ tail -f /dev/shm/runcommand.log
```

Problem is either the way the launcher is calling the emulator, or the format of
the rom files.

Issue resolved when files are extracted, and renamed from .msx2 to .rom.

## Mass Rename Files

```
$ unzip \*.zip
$ rename -n -v 's/(.*).MX2/$1.rom/g' *.MX2
```

## Apply IPS Patch

[Perl and Ruby Scripts](http://www.smwcentral.net/?p=viewthread&t=17284)

[ruby-ips.rb](https://bin.smwcentral.net/994)

```
$ chmod +x ruby-ips.rb
$ ./ruby-ips.rb -sf copy-of-rom.smc patch.ips
```

## Check SHA of file

```
$ openssl sha -sha1 filename
```

## Configure Systems and BIOS System ROM files

A set of xml descriptor files come with openMSX. View the contents of the following folders:

```
$ ls /Applications/openMSX.app/share/machines
$ ls /opt/openMSX/share
$ ls /usr/share/openmsx
```

Once you have determined the location of the xml descriptor files, you can copy
them (to `~/.openMSX/share`), add in the BIOS ROM files, and update the xml files
to suit your needs.

```xml
<!-- example Panasonic_FS-A1GT.xml -->
<!-- ... -->

  <PanasonicRom id="Firmware ROM">
    <rom>
      <sha1>e779c338eb91a7dea3ff75f3fde76b8af22c4a3a</sha1>
      <sha1>5fa3aa79aeba2c0441f349e78e9a16d9d64422ea</sha1>
      <filename>./panasonic/fs-a1gt_firmware.rom</filename>
    </rom>
  </PanasonicRom>

<!-- ... -->
```
