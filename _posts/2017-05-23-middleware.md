---
layout: post
title: "Middleware"
date: 2017-05-23 12:00
tags: ruby rails middleware
categories: ruby
---

## Prerequisites

An understanding of...

* The HTTP Request/Response Cycle
* MVC

How does the application know how to map HTTP requests to Controller actions?

## Rack::Middleware

Rails routes are a middleware that map the HTTP Verb and Path (within a HTTP request) to a Controller action.

```ruby
YourRailsApp::Application.routes.draw do
  get '/profile', to: 'users#show'  # UsersController.action(:show).call
end
```

## Middleware in Use

A chain of classes that are initialized with a Rack Application, and respond to
`#call` with `[status_code, headers, body]`.

```
$ rake middleware
use Rails::Rack::Logger  # responsible for the files in ./log/
use Rollbar::Middleware::Rails::RollbarMiddleware  # responsible for reporting 400/500 status codes.
use ActionDispatch::Cookies
use ActionDispatch::Session::CookieStore
use ActionDispatch::Flash
...
run YourRailsApp::Application.routes  # the HTTP Verbs and Paths that your app can respond to
```

[Rails Middleware](http://edgeguides.rubyonrails.org/rails_on_rack.html#internal-middleware-stack)

## Types of Middleware

* Development/Debugging
* Logging/Error reporting
* Session management
* Routing

Two common types: When given a HTTP request, perform a side effect, or return some information (respond).


## Examples

* [ActiveRecord::Migration::CheckPending](https://github.com/rails/rails/blob/96aa18974adf7321f265eafbdfe74c7c6e007cb0/activerecord/lib/active_record/migration.rb#L545)
* [Rack::CommonLogger](https://github.com/rack/rack/blob/master/lib/rack/common_logger.rb)
* [ActionDispatch::Flash](https://github.com/rails/rails/blob/bc4781583d9db237dd928b01743c6db7596a36b3/actionpack/lib/action_dispatch/middleware/flash.rb)
* [Fun with Rack](http://radavis.github.io/2014/12/02/fun-with-rack.html)
* [Rollbar::Middleware](https://github.com/rollbar/rollbar-gem/blob/master/lib/rollbar/middleware/rails/rollbar.rb)


```ruby
class Middleware
  def initialize(app)
    @app = app
  end

  def call(env)
    # before HTTP response
    status, headers, body = @app.call(env)  # call the next middleware application
    # after building HTTP response
    [status, headers, body]
  end
end
```

Questions:

* What is stored in `env`?
* Where is `@app.call(env)` located in the middleware?
* What happens in the `#call` method?
* What does the `#call` method return?
* What could we do with this?


## Other Reading

* [Introducing Rack](http://chneukirchen.org/blog/archive/2007/02/introducing-rack.html)
* [rack.github.io](http://rack.github.io/)
* [Add Middleware to Rails](http://guides.rubyonrails.org/rails_on_rack.html#configuring-middleware-stack)
