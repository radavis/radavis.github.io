## Specs

* Raspberry Pi 3
* MicroSD: 4GB or greater
* Raspbian Jessie v8.0/Retropie v4.3
* Acer GN246HL 1920x1080p 144Hz Monitor [[Amazon](https://www.amazon.com/Acer-GN246HL-Bbid-24-Inch-Display/dp/B00KO4518I)]

## Copy Rom and Create Config File

```
$ scp pengo.zip pi@my-cool-retropie:/home/pi/RetroPie/roms/arcade
$ ssh pi@my-cool-retropie
$ cd /home/pi/RetroPie/roms/arcade/
$ touch pengo.zip.cfg
$ nano pengo.zip.cfg
```

## romname.zip.cfg

```
video_allow_rotate = true
video_rotation = 3
```

![After applying pengo.zip.cfg](/assets/images/retropie-vertical-display-pengo-cfg-01.jpg)

This gets us to a point where the game is in the correct orientation. However,
the ratio of the video on the screen isn't quite right.

## Enable TATE mode

```
$ nano /opt/retropie/configs/all/retroarch-core-options.cfg
```

```
mame2003-tate_mode = "enabled"
```

![After enabling TATE mode](/assets/images/retropie-vertical-display-tate-mode-01.jpg)

The video ratio feels good. Can we do anything about the unused space/black bars?

## Disable Overscan

```
$ sudo nano /boot/config.txt
```

```
disable_overscan=1
```

![After disabling overscan](/assets/images/retropie-vertical-display-disable-overscan-01.jpg)

Looks great!

## Other Config and Commands That Were Investigated

### Configure Resolution

```
$ sudo raspi-config
```

* Advanced Options > Overscan > Yes
* Advanced Options > Resolution > CEA Mode 16 1920x1080 60Hz 16:9

**No Change**


### Set HDMI Mode in config.txt

```
# hdmi_safe=1
hdmi_group=1
hdmi_mode=16  # for 1920x1080p@60Hz
# hdmi_force_mode=1
```

Or...

```
# hdmi_safe=1
hdmi_group=2
hdmi_mode=82  # for 1920x1080p@60Hz
# hdmi_force_mode=1
```

[source](https://www.raspberrypi.org/documentation/configuration/config-txt/video.md)

**Didn't try, since `/opt/vc/bin/tvservice -s` reported CEA (16)**

### Set Resolution in Emulation Station

```
$ emulationstation --help
$ nano /opt/retropie/configs/all/autostart.sh
```

```
emulationstation --resolution 1920 1080
```

[source](https://github.com/Aloshi/EmulationStation/issues/55)

**No Change**. This sets the resolution in the front-end.
