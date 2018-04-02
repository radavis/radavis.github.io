---
layout: post
title: "Rack::Cascade and Modular Sinatra Applications"
date: 2018-03-30 09:00
tags: rack sinatra
---

```ruby
# app.rb
require 'sinatra/base'

class Banana < Sinatra::Base
  get('/banana') { '🍌' }
end

class Broccoli < Sinatra::Base
  get('/broccoli') { '🥦' }
end

class Bacon < Sinatra::base
  get ('/bacon') { '🥓' }
end
```

```ruby
# config.ru
require 'rubygems'
require 'bundler'
Bundler.setup(:default)

require './app'
run Rack::Cascade.new [Banana, Broccoli, Bacon]
```

```ruby
# Gemfile
source 'https://rubygems.org'

gem 'sinatra'
```

```bash
$ bundle
$ rackup
```

Visit [localhost:9292/broccoli](localhost:9292/broccoli).

[source](https://www.safaribooksonline.com/library/view/sinatra-up-and/9781449306847/ch04.html)
