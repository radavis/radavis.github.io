---
layout: post
title: "Weather Underground API Notes"
date: 2016-03-14 10:00
tags: api
---


base url: http://api.wunderground.com/api/{key}/{method}/q/latitude,longitude.{json/xml}


weather via lat,long
--------------------

address: 374 Congress St, Boston, MA
latitude: 42.350074
longitude: -71.047606

url: http://api.wunderground.com/api/8dc69e5464b0ec39/conditions/q/42.350074,-71.047606.json


historical data
---------------

http://api.wunderground.com/api/8dc69e5464b0ec39/history_YYYMMDD/q/42.350074,-71.047606.json
