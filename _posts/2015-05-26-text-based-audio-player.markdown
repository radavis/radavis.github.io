---
layout: post
title: "Text-based Audio Player"
date: 2015-05-26 11:50
tags: audio music
categories: cli
---

There is a little known feature of VLC that allows you to have an interactive text interface for creating playlists and listening to music.

## Start VLC in ncurses mode

```
vlc --intf ncurses
```

**Note**: You may have to create an alias or add the location of VLC to your PATH. Your choice.

```
alias vlc="/Applications/VLC.app/Contents/MacOS/VLC"
export PATH="$PATH:/Applications/VLC.app/Contents/MacOS/VLC"
```

## Shortcuts

* `key` action
* `shift + b` browse
* `space` add file/folder, play/pause
* `h` help
* `q` quit

## Alias

Here is an alias that makes startup and nagivation easier. Throw this in your `~./zshrc` or `.bash_profile`

```
export MUSIC="/Volumes/32GB_MICRO/music"
alias nvlc="vlc --intf ncurses --browse-dir $MUSIC"
```

Now, start it up with `nvlc`.
