---
layout: post
title: "Getting Started with MySQL on Mac OS X"
date: 2016-07-16 15:30
tags: mysql
---


# Install MySQL

Download [MySQL Community Server](https://dev.mysql.com/downloads/mysql/), and
install it.

Take note of the username and password it generates for you.

![MySQL Username and Password](/images/mysql-password.png)


# Add it to the PATH

Add the MySQL bin folder to your `PATH` and restart your terminal:

```no-highlight
# ~/.zshrc

export PATH="$PATH:/usr/local/mysql/bin/"
```


# Forget that password

You're not going to remember that password. Throw it into a `.my.cnf` file in
your home folder so you don't have to type it in.

```no-highlight
# ~/.my.cnf
[client]
user=root
password=password-from-eariler
```

Make this file only readable by you.

```no-highlight
$ chmod 0600 ~/.my.cnf
```


# Start it up

Start up MySQL Server from the System Preferences menu.

![MySQL System Preferences](/images/mysql-server.png)


Now, you should be able to get to the MySQL console by typing `mysql`!
