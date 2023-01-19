---
layout: post
title: "View a CSV on the Command Line"
date: 2018-03-29 11:00
tags: csv
categories: cli
---

```
$ column -s, -t < somefile.csv | less -#2 -N -S
```

* `-s,` - use comma as the column delimiter
* `-t` - create a table
* `-#2` - set horizontal scroll amount
* `-N` - don't use line numbers
* `-S` - chop long lines

[source](https://stackoverflow.com/a/3800791/2675670)


### Resources

* [Working with CSVs on the Command Line](http://bconnelly.net/working-with-csvs-on-the-command-line/)
