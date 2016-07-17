---
layout: post
title: "Building Kodi Add-ons"
date: 2016-07-16 15:30
tags: kodi xbmc
comments: true
---

These are my notes on building a Kodi Add-on. This is mostly a summarization of
the material you can find in the
[Kodi Wiki Manual](http://kodi.wiki/view/Main_Page).

These notes are focused on the [v16.0 Jarvis](http://kodi.wiki/view/releases)
release.


# Add-on Folder Structure

```no-highlight
<addon-type>[.<media-type>].<addon-title>
  ├── LICENSE.txt       - Software License (GNU/MIT/GPLv2/Whatever)
  ├── addon.py          - Python code for this add-on
  ├── addon.xml         - XML metadata for this add-on
  ├── changelog.txt     - Description of changes per release
  ├── fanart.jpg        - Background image: 16:9 ratio, 1280x720 or 1920x1080
  ├── icon.png          - Icon image: 256x256, solid non-transparent background
  └── resources
    ├── data            - Static data: XLT/XSD, XML, etc
    ├── language        - Translations of the add-on
    ├── lib             - Module definitions, 3rd party libraries
    ├── media           - Pictures, audio, video
    └── settings.xml    - User-configurable settings
```


# Add-on Types and Media Types

* repository
* plugin - adds functionality
  - audio
  - video
  - picture
  - weather
* script - a runnable program
  - module - provides support for other add-ons
  - service - runs on login or startup
* skin
* resource


# The "Hello World" Script

[[Source](http://kodi.wiki/view/HOW-TO:HelloWorld_addon)]

The easiest way to get started is to clone down the HelloWorld repository, open
it up in your favorite text editor, and have a look around.

```no-highlight
$ git clone git@github.com:zag2me/script.hello.world.git
$ atom script.hello.world
```

When you are ready to try out your changes, zip up the folder (Kodi can easily
install add-ons this way), and load it into your locally running version of
Kodi.

```no-highlight
$ zip -r script.hello.world.zip script.hello.world/*
```

Within the Kodi interface: `System > Settings > Add-ons > Install from zip file`.
Then, navigate to the zip file you just created.

Run your script: `Programs > Hello World`.

**Note**: After you make changes to your add-on, you will need to restart Kodi,
_then_ install your add-on. Otherwise, you will get a "Failed to install Add-on
from zip file" message. At least, this has been my experience.


# The `userdata` Folder and Log File

> The userdata folder is where all of your settings and customizations are
> stored.

[[Source](http://kodi.wiki/view/userdata)]

| Operating System | Location                                      |
| ---------------- | --------------------------------------------- |
| Mac OS X         | `~/Library/Application Support/Kodi/userdata` |
| Linux            | `~/.kodi/userdata/`                           |
| Windows          | `%APPDATA%\kodi\userdata`                     |

The docs say that the logfile is located one level up from the `userdata`
folder. I found mine some place slightly different:

```no-highlight
$ cd ~
$ find . -name "kodi.log"
./Library/Logs/kodi.log
```

Navigate to `Settings > System > Logging` and enable the following:
  * Enable event logging
    - Enable notification event logging
  * Enable component-specific event logging

Keep an eye on the logfile while making changes.

```no-highlight
$ tail -f ~/Library/Logs/kodi.log
```

# JSON-RPC

The [JSON-RPC Specification](http://www.jsonrpc.org/specification) allows a
client to request a server to run a method/function/procedure (eg- turn up the
volume, play a video). Kodi has a built-in
[JSON-RPC API](http://kodi.wiki/view/JSON-RPC_API/v6)
which allows us to interact with the player, and call "remote procedures"
defined by the API.

[JSON-RPC API Examples](http://kodi.wiki/view/JSON-RPC_API/Examples)


# Resources

* [Kodi Add-on Development](http://kodi.wiki/view/Add-on_development)
* [Kodi Add-on Structure](http://kodi.wiki/view/Add-on_structure)
* [Kodi Addon.xml File](http://kodi.wiki/view/Addon.xml)
* [Kodi Built-in Functions](http://kodi.wiki/view/List_of_Built_In_Functions)
* [Kodi Community Forum](http://forum.kodi.tv/index.php)
* [Kodi Database](http://kodi.wiki/view/The_Kodi_Database)
