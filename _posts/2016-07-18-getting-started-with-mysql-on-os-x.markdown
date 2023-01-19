---
layout: post
title: "Getting Started with MySQL on OS X"
date: 2016-07-18 13:00
tags: mysql
---


# Install MySQL

Download [MySQL Community Server](https://dev.mysql.com/downloads/mysql/), and
install it.

Take note of the username and password it generates for you.

![MySQL Username and Password. Of course I have changed it from this. I'm no dummy.](/assets/images/mysql-password.png)


# Add it to the PATH

Add the MySQL bin folder to your `PATH` and restart your terminal:

```no-highlight
# ~/.zshrc

export PATH="$PATH:/usr/local/mysql/bin/"
```


# Change the password, then forget it.

```no-highlight
$ mysql
mysql> SET PASSWORD = PASSWORD('your_new_password');
Query OK, 0 rows affected, 1 warning (0.00 sec)
```

Create a `.my.cnf` file in your home folder so you don't have to authenticate
when you are in your local dev environment.

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

![MySQL System Preferences](/assets/images/mysql-server.png)


Now, you should be able to get to the MySQL console by typing `mysql`!
