---
layout: post
title: "Fun with ffmpeg"
date: 2015-02-03 12:00
tags: ffmpeg command-line bash
categories: cli
comments: true
---

# Sample `ffmpeg` Commands

## Convert to 480p
```
$ ffmpeg -i input.mp4 -s hd480 -c:v libx264 -crf 23 -c:a aac -strict -2 output.mp4
```

## Convert to 720p via scaling, copy audio
```
$ ffmpeg -i input.mp4 \
  -c:v libx264 -preset medium -tune film -crf 22 -vf scale=-1:720 \
  -c:a copy \
  output.mp4
```

## Convert to 720p via scaling, encode 128kbit audio
```
$ ffmpeg -i input.mp4 \
  -c:v libx264 -preset medium -tune film -crf 22 -vf scale=-1:720 \
  -c:a libfdk_aac -b:a 128k \
  output.mp4
```

## `-preset` Options
Set the encoding speed to compression ratio. Faster compression yields a larger file.
* ultrafast
* superfast
* veryfast
* faster
* fast
* medium
* slow
* slower
* veryslow

## Making Clips

```
$ ffmpeg -i input.mov \
  -ss 00:00:05.00 \
  -to 00:23:25.17 \
  -c copy \
  -avoid_negative_ts 1 \
  clip.mov
```

## Joining Clips

```
# files.txt
file 'clip1.mov'
file 'clip2.mov'
file 'clip3.mov'
```

```
$ ffmpeg -f concat -i files.txt -c copy output.mov
```

## Replacing Audio

```
$ ffmpeg -i OriginalVideo.mp4 -i NewAudio.wav -acodec copy -vcodec copy -map 0:v -map 1:a Output.mp4
```

## wav to flac

```
$ find /Volumes/128GB_MSD/_archive/tycho-epoch-wav -type f -iname "*.wav" -exec sh -c \
'bn=${1##*/}; bn=${bn%.*}; ffmpeg -loglevel 16 -i "$1" "${0}${bn}.flac"' /Volumes/128GB_MSD/_archive/tycho-epoch/ {} \;
```

## References
* [FFmpeg and H.264 Encoding Guide](https://trac.ffmpeg.org/wiki/Encode/H.264)
* [How can I convert a 1080p wmv video to a 720p video?](http://askubuntu.com/questions/99643/how-can-i-convert-a-1080p-wmv-video-to-a-720p-video)
* [FFmpeg: Concatenate](https://trac.ffmpeg.org/wiki/Concatenate) - Check out the `mmcat` script at the bottom of the page.
* [find + ffmpeg](https://unix.stackexchange.com/a/428025/157412)
