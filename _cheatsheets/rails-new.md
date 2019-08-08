---
layout: cheatsheet
title: "rails new"
tags: rails cheatsheet
---


Notes on the `rails new` command.


## PostgreSQL DB, No TurboLinks, No MiniTest

```
$ rails new appname --database=postgresql --skip-bundle --skip-turbolinks --skip-test
```


## Vue.js through Webpack

```
$ rails new appname --skip-turbolinks --webpack=vue
```

[source](https://www.engineyard.com/blog/rails-and-vue-js-part-1)


## Rails Composer

Create a starter Rails app w/ extras added in, automatically.

```
$ rails new myapp -m https://raw.github.com/RailsApps/rails-composer/master/composer.rb
```
