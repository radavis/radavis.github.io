---
layout: post
title: "Ubuntu Services"
date: 2019-09-24 23:25
categories: cheatsheet
---

Services live at `/lib/systemd/system`

## Example `.service` File

```
[Unit]
Description=My Service
After=network.target

[Service]
Type=simple
User=rd
WorkingDirectory=/home/rd
ExecStart=/home/nanodano/my_daemon --option=123
Restart=always

[Install]
WantedBy=multi-user.target
```

[source](https://www.devdungeon.com/content/creating-systemd-service-files)
