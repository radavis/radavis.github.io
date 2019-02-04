---
layout: post
title: "Fonts on macOS"
date: 2019-02-04 18:55
tags: rails, rest, http
---

* Locations:
  - `/System/Library/Fonts` (not writeable)
  - `/Library/Fonts` (system-wide)
  - `~/Library/Fonts` (local user)
* TrueType Fonts: `.ttf` or `.ttc`
* OpenType Fonts: `.otf` or `.ttf`


# Copy `.ttf` fonts for use by the local user

```
$ cp *ttf ~/Library/Fonts
```

## Resources

* [How to Locate Mac or Windows Font Files](https://www.lifewire.com/locate-font-files-1074150)
* [Installing fonts from the terminal](https://apple.stackexchange.com/questions/240381/installing-fonts-from-terminal-instead-of-font-book)
* [B612 Font Family](http://b612-font.com/)
* [IBM 3270 Font](https://github.com/rbanffy/3270font)
* [Hack Font](https://sourcefoundry.org/hack/)
* [Slant: What are the best programming fonts?](https://www.slant.co/topics/67/~best-programming-fonts#88)
