---
layout: post
title: "Development Install Script for OSX"
date: 2015-02-05 12:00
tags: bash-scripting ruby rails development
---

**Update:** While not 100% perfect, the latest iteration of this install script lives, [here](https://github.com/radavis/dev-install)

This is what I run on a new machine to get my development environment up and running. [(source)](https://gist.github.com/radavis/a4add7f2e9872f213e76)

```bash
#!/bin/bash
set -e

exec > >(tee $0.log) 2>&1

echo "---Install Apple Xcode---"
read -p "Have you installed Apple Xcode? (y/n): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
  echo "Please run the following command and restart before continuing:"
  echo "$ xcode-select --install"
  exit 1
fi

echo "---Install Homebrew---"
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/install/master/install)"

echo "---Install Cask---"
brew install caskroom/cask/brew-cask

echo "---Install CLI Development Tools---"
CLIDevTools=( 'chruby' 'ruby-install' 'git' 'heroku-toolbelt' 'imagemagick' 'node' 'redis' );
for app in "${CLIDevTools[@]}"; do
  brew install $app
done

echo "---Install Applications---"
Applications=( 'dropbox' 'google-chrome' 'firefox' 'slack' 'mailbox' );
MoreApps=( 'flux' 'menumeters' 'openemu' 'xscreensaver' 'shiftit');
GUIDevTools=( 'atom' 'sublime-text' 'dash' 'github' 'iterm2' 'postgres' 'gitx' 'filezilla' );
MediaApps=( 'gimp' 'paintbrush' 'vlc' 'xquartz' 'inkscape' );

AllApps=( "${Applications[@]}" "${GUIDevTools[@]}" "${MediaApps[@]}" );
for app in "${AllApps[@]}"; do
  brew cask install --appdir="/Applications" $app
done
echo "export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin" >> ~/.bashrc
echo "export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin" >> ~/.zshrc

echo "---Install Oh My ZSH---"
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

echo "---Configure chruby and Install Ruby---"
echo "source /usr/local/share/chruby/chruby.sh" >> ~/.bashrc
echo "source /usr/local/share/chruby/auto.sh" >> ~/.bashrc
echo "source /usr/local/share/chruby/chruby.sh" >> ~/.zshrc
echo "source /usr/local/share/chruby/auto.sh" >> ~/.zshrc
source ~/.bashrc

RubyVersions=( '2.0.0-p643' '2.1.6' '2.2.2' );
for version in "${RubyVersions[@]}"; do
  ruby-install ruby $version
done

echo "---Set the Default Ruby Version to v2.0.0---"
echo "ruby-2.0.0-p643" > ~/.ruby-version

echo "---Install Ruby Gems---"
cd ~
echo "gem: --no-rdoc --no-ri" >> ~/.gemrc
RubyGems=( 'bundler' 'rubygems-bundler' 'rails' 'make_it_so' 'et' 'gist' 'hub' 'pry' );
for app in "${RubyGems[@]}"; do
  gem install $app
done

number_of_cores=`sysctl -n hw.ncpu`
bundle config --global jobs `expr $number_of_cores - 1`

gem regenerate_binstubs

echo "---Developer Tools Install Script Complete!---"
```
