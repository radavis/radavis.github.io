# Add-on for EmulationStation/RetroPie

ncurses interface for browsing, searching, and downloading roms.

## Technologies

*
* Transmission BitTorrent client
* Archive.org - for rom torrents
* Emuparadise.me - for rom ratings

```
pi@RetrOrangePi:~$ ls
Desktop  RetroPie  RetroPie-Setup  RetrOrangePi
pi@RetrOrangePi:~$ cd RetroPie
pi@RetrOrangePi:~/RetroPie$ ls -la roms
total 264
drwxr-xr-x 66 pi pi 4096 Apr 24  2018 .
drwxr-xr-x  7 pi pi 4096 Feb  3 04:44 ..
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 ags
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 amiga
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 amstradcpc
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 apple2
drwxr-xr-x  4 pi pi 4096 Nov 24  2017 arcade
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 arcadia
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 atari2600
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 atari5200
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 atari7800
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 atari800
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 atarilynx
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 atarist
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 c64
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 coco
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 coleco
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 cps1
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 cps2
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 cps3
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 crvision
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 daphne
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 dragon32
drwxr-xr-x  2 pi pi 4096 Aug 30 02:35 dreamcast
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 fba
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 fds
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 gameandwatch
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 gameboy
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 gamegear
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 gb
drwxr-xr-x  2 pi pi 4096 Feb  3 04:45 gba
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 gbc
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 genesis
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 intellivision
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 love
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 macintosh
drwxr-xr-x  4 pi pi 4096 Nov 26  2017 mame2003
drwxr-xr-x 13 pi pi 4096 Nov 24  2017 mame-advmame
drwxr-xr-x  4 pi pi 4096 Nov 24  2017 mame-libretro
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 mame-mame4all
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 mastersystem
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 megadrive
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 msx
drwxr-xr-x  3 pi pi 4096 Nov 24  2017 n64
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 neogeo
drwxr-xr-x  2 pi pi 4096 Feb  3 04:48 nes
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 ngp
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 ngpc
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 pc
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 pcengine
drwxr-xr-x 13 pi pi 4096 Sep  4 13:21 ports
drwxr-xr-x  2 pi pi 4096 Nov 26  2017 psp
drwxr-xr-x  2 pi pi 4096 Nov 26  2017 psx
drwxr-xr-x  2 pi pi 4096 Nov 26  2017 scummvm
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 sega32x
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 segacd
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 sg-1000
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 snes
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 vectrex
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 videopac
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 virtualboy
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 wonderswan
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 wonderswancolor
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 x68000
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 zmachine
drwxr-xr-x  2 pi pi 4096 Nov 24  2017 zxspectrum
```

## ncurses

A library for creating text-based user interfaces. It provides functions to
move the cursor, create windows, draw menus, produce colors, accept mouse input,
etc.

Most of the library consists of convenience interfaces to functions and data
structures used to manipulate the virtual screen.

* keyboard input -> `wgetch()`
* mouse input -> `wgetch()`
* output -> `curscr`, `newscr` window data structures, and `mvcur()`

### termcap and terminfo

* termcap - a file that lists all the capabilities of a particular terminal
* terminfo - database of terminal information and control characters, replaces termcap

## Resources

* [ncurses Programming howto](http://tldp.org/HOWTO/NCURSES-Programming-HOWTO/index.html)
* [A Hacker's Guide to ncurses](https://invisible-island.net/ncurses/hackguide.html)
* [GCC and Make - Compiling, Linking, and Building C/C++ Applications](http://www.ntu.edu.sg/home/ehchua/programming/cpp/gcc_make.html)
