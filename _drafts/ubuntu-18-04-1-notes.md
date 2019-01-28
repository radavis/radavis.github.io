# Ubuntu 18.04.1 Notes

## Install Atom

[source](https://flight-manual.atom.io/getting-started/sections/installing-atom/#platform)

Installing via `apt` failed with a 500 error. Installed via `.deb` package.

## Install Docker

[source](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04)

```
sudo apt install docker-ce
sudo apt isstall docker-compose
```

## Install nvm

[source](https://github.com/creationix/nvm)

## List all groups

[source](https://stackoverflow.com/a/14060177/2675670)

```
$ cut -d: -f1 /etc/group | sort
$ getent group | sort
```

## Linuxbrew

```
- Install the Linuxbrew dependencies if you have sudo access:
  Debian, Ubuntu, etc.
    sudo apt-get install build-essential
  Fedora, Red Hat, CentOS, etc.
    sudo yum groupinstall 'Development Tools'
  See http://linuxbrew.sh/#dependencies for more information.
- Add Linuxbrew to your ~/.profile by running
    echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >>~/.profile
- Add Linuxbrew to your PATH
    PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
- We recommend that you install GCC by running:
    brew install gcc
- After modifying your shell profile, you may need to restart your session
  (logout and then log back in) if the brew command isn't found.
- Run `brew help` to get started
- Further documentation:
    https://docs.brew.sh
```

```
test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
```

## Ansible

```
$ sudo apt install ansible
```

## awscli

```
$ aws configure
```

## apt packages

```
ansible
apt-transport-https
atom: https://flight-manual.atom.io/getting-started/sections/installing-atom/#platform-linux
chrome-gnome-shell
chromium-browser
curl
deluge
gimp
git
gnome-tweak-tool
lm-sensors
sqlite3
vlc
xclip
```

## snap packages

```
slack
```
