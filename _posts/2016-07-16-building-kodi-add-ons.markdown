---
layout: post
title: "Building Kodi Add-ons"
date: 2016-07-16 15:30
tags: kodi xbmc
---

### Add-on Folder Structure

```no-highlight
<addon-type>[.<media-type>].addon-title
  ├── LICENSE.txt - Software License (GNU/MIT/GPLv2/Whatever)
  ├── addon.py - Python code for this add-on
  ├── addon.xml - XML metadata for this add-on
  ├── changelog.txt - Description of changes per release
  ├── fanart.jpg - Background image: 16:9 ratio, 1280x720 or 1920x1080
  ├── icon.png - Icon image: 256x256 pixels, solid, non-transparent background
  └── resources
    ├── data - Static data:  XLT/XSD, XML, etc
    ├── language - Translations of the plugin
    ├── lib - Module definitions, 3rd party libraries
    ├── media - Pictures, audio, video
    └── settings.xml - User-configurable settings
```

### Addon Types and Media Types

* repository
* plugin - adds functionality
  - audio
  - video
  - picture
  - weather
* script - a runnable program
  - module - provides support for other addons
  - service - runs on login or startup
* skin
* resource


### Resources

* [Kodi Add-on Structure](http://kodi.wiki/view/Add-on_structure)
