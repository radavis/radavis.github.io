# Raspberry Pi Projects

* Auto-mount drive on network.
* Auto-rip an audio CD to the cloud. CD->Flac on AWS S3.
* Create a service
* BUILD A DIGITIZATION CENTER!


## Automatic Ripping Machine (ARM)

> Insert an optical disc (Blu-Ray, DVD, CD) and checks to see if it's audio,
> video (Movie or TV), or data, then rips it.

[[source](https://github.com/automatic-ripping-machine/automatic-ripping-machine)]


## Rip a CD to Flac with abcde

```
$ sudo apt-get update
$ sudo apt-get install flac eject abcde
$ touch ~/.abcde.conf
$ abcde
```

[[source](https://www.raspberrypi.org/forums/viewtopic.php?t=56506)]

* [configuration](http://www.andrews-corner.org/linux/abcde/abcde_lossless.html).
* [abcde man](http://lly.org/~rcw/abcde/page/abcde.1.html)
* [flac documentation](https://xiph.org/flac/documentation_tools_flac.html)

Pros:

* Simple
* Straightforward w/ proper config

Cons:

* Could be faster (rip iso -> process flac in cloud)

Next Steps:

* Execute `abcde` on disc insert... Determine what app to run on disc insert.
* Auto-upload flac files to a cloud provider. See abcde example scripts.


## Rip a Disc

```
$ sudo apt-get install genisoimage
$ isoinfo -d -i /dev/cdrom  # get block size/volume size
$ sudo if=/dev/cdrom of=image_name.iso bs=2048 count=<volume_size>  # rip iso
$ md5sum /dev/cdrom
$ md5sum image_name.iso
```

[[source](https://askubuntu.com/a/874945)]


## Backup files to Mega (cloud storage)

```
$ sudo apt-get install megatools
$ touch ~/.megarc  # add username and password
$ megadf
$ megamkdir /Root/Music
$ megacopy --local Music --remote /Root/Music  # unidirectional sync
```

Use the following [configuration file](https://megatools.megous.com/man/megarc.html)
