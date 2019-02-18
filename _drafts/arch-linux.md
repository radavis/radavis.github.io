# Arch Linux

## Create Boot USB (macOS)

```
dd if=~/Downloads/archlinux-2019.02.01-x86_64.iso of=/dev/rdiskX bs=4m && sync
```

## Installation Instructions

[source](https://wiki.archlinux.org/index.php/Installation_Guide)

```
nano install.txt
```

## Partition

> Partitioning a hard drive divides the available space into sections that can
> be accessed independently.

**Partition Table Types**

* Master Boot Record (MBR)
* GUID Partition Table (GPT) - Successor to MBR
* "Paritionless" - Uncommon

> Note:
> UEFI systems require an EFI system partition.
> BIOS systems that are partitioned with GPT require a BIOS boot partition if
> GRUB is used as the bootloader.

**Partition Tools**

* `fdisk`
* `parted`
* `cfdisk`

**UEFI/GPT Partition Layout (BIOS System, GPT Partition Table)**

| Mount point | Partition | Size  | Notes                |
| ----------- | --------- | ----- | -------------------- |
|             | /dev/sda1 | 1MB   | BIOS boot partition  |
| /           | /dev/sda2 | 32GB  | Legacy BIOS bootable |
| [SWAP]      | /dev/sda3 | 1GB   |                      |
| /home       | /dev/sda4 | Rest  |                      |

**Swap Size Recommendations**

[source](https://itsfoss.com/swap-size/)

* Red Hat: 20% of RAM if system has >= 4GB RAM installed.
* CentOS:
  - 2x RAM if < 2GB RAM installed
  - RAM size + 2GB if > 2GB RAM installed
* Ubuntu:
  - At least RAM size, at most 2x RAM size if < 1GB installed
  - At least sqrt(RAM size), at most 2x RAM size if > 1GB installed
  - sqrt(RAM size) + RAM size if using hibernation
* Arch: More than 512MB

## BIOS Boot Partition

[source](https://www.gnu.org/software/grub/manual/grub/html_node/BIOS-installation.html#BIOS-installation)

* `fdisk` partition type: `BIOS boot`
* `parted /dev/disk set partition-number bios_grub on`
* `gdisk` partition type: `0xEF02`
* Set GUID directly: `21686148-6449-6e6f-744e656564454649`

## Check Partition Alignment

```
# parted /dev/sda
(parted) align-check optimal 1
```

## Format

```
mkfs.ext4 /dev/sda2
mkfs.ext4 /dev/sda4
mkswap /dev/sda3
swapon /dev/sda3
```

## Mount

```
$ mount /dev/sda2 /mnt
```

## Boot Loader

[source](https://wiki.archlinux.org/index.php/Arch_boot_process#Boot_loader)

Boot loaders that support a BIOS System with a GPT Partition table:

* Clover
* **GRUB**
* Syslinux

**Install GRUB**

```
pacman -Syu
pacman -S grub
grub-install --target=i386-pc --recheck /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
```
