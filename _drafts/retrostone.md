# Retrostone

[homepage](https://www.8bcraft.com/retrostone/)

[kickstarter](https://www.kickstarter.com/projects/583173617/retrostone-ultimate-retrogaming-console)

## Specs

* 3.5" LCD 320x240 Display (Composite)
* 1GB DDR RAM
* Allwinner H3 (ARM Cortex-A7 Quad-core 1.2GHz) Processor
* 100M Ethernet
* RGB24 Video Chip
* 26 open GPIO pins
* 3Ah (3000mAh) Battery

## Software

* Arbian
* RetrOrangePi

## Video Output

The Allwinner H3 has two video outputs (HDMI and CVBS).

* HDMI output -> HDMI connector
* CVBS (or composite video) -> LCD

[Armbian: How to reconfigure video output?](https://docs.armbian.com/Hardware_Allwinner/#how-to-reconfigure-video-output)

## Configuration

`/boot/armbianEnv.txt`

## WiFi

[source](https://forum.armbian.com/topic/1237-opi-one-wireless-success/)

```
$ sudo nmtui  # 'Activate a connection' -> Select WiFi SSID, enter password. Done.
$ hostname -I
```

## Resources

* [RetrOrangePi](https://github.com/retr0rangepi?tab=repositories)
