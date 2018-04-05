---
layout: post
title: "Notes on the rename Command"
date: 2017-10-01 16:30
tags: rename bash
categories: cli
---

## Install `rename`

[link](https://superuser.com/questions/152627/renaming-many-files-in-mac-os-x-batch-processing)

```no-highlight
$ brew install rename
```

## Help

```no-highlight
$ rename --help
Usage:
    rename [switches|transforms] [files]

    Switches:

    -0/--null (when reading from STDIN)
    -f/--force or -i/--interactive (proceed or prompt when overwriting)
Wide character in print at /System/Library/Perl/5.18/Pod/Text.pm line 286.
    -g/--glob (expand "*" etc. in filenames, useful in Windows™ CMD.EXE)
    -k/--backwards/--reverse-order
    -l/--symlink or -L/--hardlink
    -M/--use=*Module*
    -n/--just-print/--dry-run
    -N/--counter-format
    -p/--mkpath/--make-dirs
    --stdin/--no-stdin
    -t/--sort-time
    -T/--transcode=*encoding*
    -v/--verbose

    Transforms, applied sequentially:

    -a/--append=*str*
    -A/--prepend=*str*
    -c/--lower-case
    -C/--upper-case
    -d/--delete=*str*
    -D/--delete-all=*str*
    -e/--expr=*code*
    -P/--pipe=*cmd*
    -s/--subst *from* *to*
    -S/--subst-all *from* *to*
    -x/--remove-extension
    -X/--keep-extension
    -z/--sanitize
    --camelcase --urlesc --nows --rews --noctrl --nometa --trim (see manual)
```

## Examples

```no-highlight
$ rename -n -v 's/file_(\d+)/"squared_".$1*$1/e' file_*
file_1.empty renamed as squared_1.empty
file_2.empty renamed as squared_4.empty
file_3.empty renamed as squared_9.empty
file_4.empty renamed as squared_16.empty

$ rename -n -v 's/Vektroid\ -\ Neo\ Cali\ -\ (\d)(.*)/$1.$2/e' *.flac
$ rename -n -v 's/Moss\ of\ Aura\ -\ Wading\ -\ (\d)(.*)/$1.$2/e' *.flac
$ rename -n -v 's/Moss\ of\ Aura\ -\ Wading\ -\ (\d)(.*)/$1.$2/e' *.flac
$ rename -n -v 's/Chrome\ Sparks\ -\ Goddess\ EP\ -\ (\d*)\ (.*)(\.flac$)/"$1.$2$3"/e' *.flac
$ rename -n -v 's/The\ Cure\ -\ Japanese\ Whispers\ -\ (\d*)\ -(.*)(\.mp3$)/"$1.$2$3"/e' *.mp3  
```

## Convert Spaces to Dashes

```no-highlight
$ find -name "* *" -type d -v | rename 's/ /-/g'
```
