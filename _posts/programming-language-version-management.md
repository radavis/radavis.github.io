---
layout: post
title: "Programming Language Version Management"
date: 2019-05-17 01:40
tags: ruby chruby ruby-install node nvm python pyenv
---

As a developer, it is typical that you will need to work with many languages,
as well as many different releases of those programming languages.

Here are my preferred Programming Language Version Management Tools that I use
on my development machine.


## Ruby: chruby and ruby-install

### Installation

```
$ brew install chruby ruby-install  # or wget install script & execute
$ ruby-install ruby-2.5.1  # install other versions, once complete
```

Add the appropriate [configuration](https://github.com/postmodern/chruby#configuration)
to your `~/.bash_profile`, `~/.zshrc`, `~/.profile`, or `~/.bashrc` file.

### Switch Version in current shell session

```
$ chruby ruby-2.5.1
```

### Switch Versions per project

```
$ echo "ruby-2.5.1" > ~/code/my-project/.ruby-version
```

### Install a Ruby Package (gem)

```
$ gem install bundler
```

[[chruby homepage](https://github.com/postmodern/chruby)]

[[ruby-install homepage](https://github.com/postmodern/ruby-install#readme)]

[[ruby homepage](https://www.ruby-lang.org/en/)]


## Node: nvm

### Installation

```
$ brew install nvm  # or curl and execute install script
$ nvm install node  # or v8.11.2
```

Add the appropriate [configuration](https://github.com/nvm-sh/nvm#installation-and-update)
to your `~/.bash_profile`, `~/.zshrc`, `~/.profile`, or `~/.bashrc` file.

### Switch Version in current shell session

```
$ nvm use v8.11.2
```

### Switch Version per project

```
$ echo "8.11.2" > ~/code/my-project/.nvmrc
```

### Install a Node Package

```
$ npm install -g uuid
```

### Run a Node Package

```
$ npx create-react-app weatherstation
```

[[nvm homepage](https://github.com/nvm-sh/nvm)]


## Python: pyenv

### Installation

```
$ brew install pyenv
$ pyenv install 2.7.15
$ pyenv install 3.7.2  # and other versions
```

Add the appropriate [configuration](https://github.com/pyenv/pyenv#installation)
to your `~/.bash_profile`, `~/.zshrc`, `~/.profile`, or `~/.bashrc` file.

### Switch Version per project

```
$ echo "3.7.2" > ~/code/my-project/.python-verson  # or
$ pyenv local 3.7.2
```

### Install a Python Package (egg)

```
$ pip install beautifulsoup
```

[[pyenv homepage](https://github.com/pyenv/pyenv)]
