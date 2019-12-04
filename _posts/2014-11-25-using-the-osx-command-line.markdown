---
layout: post
title: "Using the OSX Command Line"
date: 2014-11-25 12:00
tags: osx bash zsh command-line
categories: cli
comments: true
---

## Directory Shortcuts
```
~ - Home Directory
. - Current Directory
.. - Enclosing Directory
/ - Root Directory
```

## Change Directory `cd`
```
$ cd ~/Dropbox/code
$ cd ..
$ pwd
/Users/rd/Dropbox
```

## List Files `ls`
```
$ ls
$ ls -la
$ la
$ ls -tla
```

## Make a Directory `mkdir`
```
$ mkdir projects
$ mkdir -v code
$ mkdir -p code/sinatra-app/public code/sinatra-app/views
```

## Creating Files

```
$ touch notes.md
$ echo "# Using the OS X Command Line" > cli.md
```

## Getting Help `--help` and `man`
```
$ ls --help
ls: illegal option -- -
usage: ls [-ABCFGHLOPRSTUWabcdefghiklmnopqrstuwx1] [file ...]
$ man --help
$ man ls
$ info ls
```

## Moving and Copying `mv` and `cp`
```
$ mv projects old-projects
$ cp app.rb old-projects/
$ cp -R old-projects really-old-projects
```

## Copy with Progress Bar
```
$ rsync -r --progress /folder/to/copy /destination/folder
```

## Delete Files and Directories `rm`
```
$ rm junk.txt
$ rm -rf really-old-projects
```

## Install [Homebrew](http://brew.sh/) and [Cask](http://caskroom.io/)
These two apps allow you to install almost anything from the command line.
```
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
$ brew install caskroom/cask/brew-cask
$ brew install wget
$ brew cask install paintbrush
$ brew cask install --appdir="/Applications" vlc
$ brew search wget
$ brew info p7zip
```

## Other Useful Commands
```
$ echo
$ grep
$ la | grep .txt
$ tar
$ cat
$ head
$ tail
$ brew
$ tree
$ which
$ whoami
$ curl
$ nano
$ say 'Hello'
```

## Make a Script Executable
Add `#!/usr/bin/env ruby` to top of the file.
```
$ chmod +x food_trucks.rb
$ ./food_trucks.rb
```

## Environmental Settings and $PATH
* `/usr/local/bin` should be first when using homebrew!: `export PATH=/usr/local/bin:$PATH`
* Always append to the end of the $PATH
* Postres.app: `export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin`
```
$ printenv
$ echo $PATH
$ brew doctor
$ nano ~/.zshrc
$ nano ~/.bashrc
```

## Setting the Default Ruby Version
```
$ which ruby
$ chruby
   ruby-1.9.3-p545
   ruby-2.0.0-p451
   ruby-2.0.0-p594
   ruby-2.1.2
   ruby-2.1.3
 * ruby-2.1.4
   ruby-2.1.5
$ chruby ruby-2.1.5
$ echo "ruby-2.1.5" > ~/.ruby-version
```

## Creating Symbolic Links `ln`
```
$ ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" /usr/bin/subl
$ which atom
/usr/local/bin/atom
$ la /usr/local/bin/atom
```

## Open Editor
```
$ cd ~/Dropbox/code/launchvotes
$ atom .
$ subl .
```

## Killing a Frozen Process
```
$ ps aux | grep safari
$ kill 123
```

## Extracting a tar.gz File
```
$ tar -zxvf plans_to_take_over_the_wolrd.tar.gz
$ tar -xvjf area51_research_documents.tar.gz2
```

## Unpacking a tar file

```
$ tar -xvf filename.tar
```

## Zipping a Folder
```
zip -r archive_name.zip folder_to_compress
```

## Viewing the Contents of a tar.gz File
```
$ tar -tf filename.tar.gz
```

## Searching File Contents
slooooooow
```
$ grep -rn collection_select ~/Dropbox/code
```
faster
```
$ brew install ack
$ ack --bar
$ ack collection_select ~/Dropbox/code
```
way fast
```
$ brew install the_silver_searcher
$ ag collection_select ~/Dropbox/code
$ ag --list-file-types
$ ag "HTTP POST" --markdown
```

## Searching File Names
```
$ find ~ -iname "time.rb"
$ find . -type f -name "test.log"
```

## Find Files Modified between two Dates
```
$ find . -type f -newermt 2017-06-21 ! -newermt 2017-06-22
```

[source](https://stackoverflow.com/a/158235/2675670)

## Clean up logfiles in your home directory
```
$ find ~ -iname "*.log" -exec rm {} \;
```

## Searching for Large Files
```
$ find ~ -size +500000 -print
```

## View Disk Info
```
$ df -H
```

## Copy Your Public Key to the Clipboard
```
$ cat ~/.ssh/id_rsa.pub | pbcopy
```

## Find Network Devices
```
brew install nmap
sudo nmap -sP 192.168.1.0/24
```

## Connect via Secure Shell
```
ssh username@ip_address
ssh pi@10.0.0.151
```

## Copy files over SSH with Secure Copy
```
scp source destination
scp ~/install.sh user@ip_address:/Users/rd/install.sh
scp user@ip_address:/Users/rd/Downloads/raspbian.img ~
```

## Watch a Remote Log
```
ssh ubuntu@example.com tail -f /home/ubuntu/shared/logs/production.log
```

## Change your computer's hostname

```
sudo scutil --set HostName your-new-hostname
```

## Setting the priority of a running process

Scale is from +10 (very nice) to -10 (not nice)

```
ps aux | grep chrome
renice -n -5 -p pid
```

## List USB Devices

```
system_profiler SPUSBDataType
```

## Resize images larger than 1M

```
find . -type f -size +1M -exec convert {} -resize 50% {} \;
```

## End
```
say 'Thank you'
```
