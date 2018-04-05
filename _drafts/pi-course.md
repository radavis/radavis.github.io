# Play any Video Game from the Past (90s and later)

Configure a RetroPie (Raspberry Pi v3 w/ WiFi, RetroPie v4.3) on UNIX or Windows (10/8/7/XP/lol)

## General Steps

1. Copy Retropie Image to a SD Card
1. Boot Raspberry Pi into Retropie/Raspbian and Configure
1. `scp` some games
1. Play!

* Download image with curl or wget.
* Image is hosted on a Pi. "We're going to stress-test this thing."
* Extract image with the appropriate command based on the file extension (zip, tar.gz)
* Copy image to SD card w/ `dd`
* Set WiFi network w/ echo:
  - Open the `wpa_supplicant.conf` file for editing. "Let's tell your Pi/computer how to connect to the Internet."
  ```bash
    nano /Volumes/retropie/etc/wpa_supplicant/wpa_supplicant.conf
  ```
  - Type in the appropriate settings.
  ```
    network={    
      ssid="WIFI_AP_NAME"
      psk="WIFI_PASSWORD"
    }
  ```
* Set WiFi network for both this location, and the Home (home first).
* Enable ssh w/ touch: `touch /Volumes/boot/ssh`
* Eject SD card: `sync && eject`, click the stupid eject icon.
* Boot Pi w/ SD card.
* Finding the Pi on the network w/ `nmap`. Sticker for MAC addresses on each Pi.
* `ssh` into your Pi.
* Copy over an open-source game file or a game you already own (such as GameBoy Tetris): scp, curl + cp, GUI.
* Give out copies of GameBoy Tetris. "Could you pass this copy of "

## Guiding Principles

* One-off command line instructional course. Provide necessary hardware w/ registration fee.
* Possibly create an instructional series off of this initial offering.
* Resources for learning more.
  - Documentation for commands
  - Examples of commands
  - IP addresses: public and private network numbers
  - File extension as an identifier
  - Compressed files and how to extract them
  - extract command for decompressing anything
* Next steps for taking it to the next step.
* Wikipedia platform (maybe).
* Ridiculous question asked yield ridiculous answers:
  - A:"I have no idea, but let's see if we can come to an answer.
    [Search Google while connected to the projector]"
  - Q:"Can you provide a copy-pastable list of commands?"
    A:"In the same way you don't learn anything if you don't take notes, you
    don't learn anything if you don't type the commands."

## Parts Provided in Take-away Kit (at cost)

Enough equipment to repurpose an old HDMI monitor.

* Pi 3
* 2.5A Supply w/ cable
* microSD w/ adapter
* Case
* 1 controller
* HDMI cable

## Parts Provided as Accessories

- HDMI to DVI adapter
- HDMI to VGA cables/adapters (do these even exist?)
- 3.5mm Audio cable (Pi to Jambox)
- 3.5mm to RCA cable (Pi to Stereo)

## Prerequisites for Participants

- Typing skills
- Familiar with MacOS or Windows
- Familiar with the command line
- Familiar with a gaming system from the 90s
- Homework: bring a game you want to play, and your WiFi username and password
  (for configuration).

## Checklist (prior to showing up)

* [ ] - Home WiFi SSID and Password
* [ ] - Hostname for Raspberry Pi on your network (e.g. - `my-cool-retropie`):
* [ ] - Check for `id_rsa` and `id_rsa.pub` in `~/.ssh/`
* [ ] - Identify a password for your Raspberry Pi (something other than `raspberry`!)
* [ ] - A Retro Game cartridge (PS1 or older)

## TAs

- Ask participants if they are done.
- Ask participants, "Do you need help?," if they look confused.
- Ask participants, "What was the last command you ran?"
- Press ↑ to cycle through previously-typed commands.
- Ask participants to run the command(s) that verify the exercise is complete.
- `nano ~/.bash_history` if all parties are confused.
- Receive a free kit? Can use this as volunteering experience?

## Total Price

- $ X for hardware, instructional seminar with personal guidance
