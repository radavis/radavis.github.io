---
layout: post
title: "Fun with Rack"
date: 2014-12-02 12:00
tags: ruby rack
categories: ruby
comments: true
---

```ruby
# gem install rack
# gem install thin

require 'rack'
require 'rack/lobster'

# Rack::Builder allows us to glue together various Rack middlewares
# together to form a single application

# The webapp proc, which responds to the #call method, must return
# an array made up of a HTTP status code, a hash of headers, and a body.
webapp = Proc.new do |env|
  status = 200
  headers = { "Content-Type" => "text/html" }
  body = ["<h1>I'm a webapp!</h1>", env["HTTP_USER_AGENT"].inspect]

  [status, headers, body]
end

# Our webapp can be anything, as long as it responds to the #call
# method, accepts a hash, and returns an array of status, headers,
# and a body.
class DiskInfo
  def call(env = {})
    disk_info = `df -H`

    [200, { "Content-Type" => "text/html" }, ["<pre>#{disk_info}</pre>"]]
  end
end

# Rack::Builder#use adds a middleware to the application
# Rack::Builder#run specifies the rack application you are wrapping
# Rack::Builder#map connects the path name to the application
builder = Rack::Builder.new do
  use Rack::CommonLogger

  map '/' do
    run webapp
  end

  map '/disk' do
    run DiskInfo.new
  end

  map '/message' do
    run Proc.new { |env| [200, { "Content-Type" => "text/html" }, ["The answer is 42."]] }
  end

  map '/lobster' do
    run Rack::Lobster.new
  end
end

# Here, we can specify which ruby webserver to host our applications
#Rack::Handler::Thin.run builder, Port: 3000
Rack::Handler::WEBrick.run builder, Port: 3000
```
