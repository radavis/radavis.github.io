---
layout: post
title: "Keep track of your instances"
date: 2013-08-30 20:08
tags: ruby development
categories: ruby
comments: true
---

I recently came across this interesting way to keep track of all instances of a class.

```
class Car
  @@cars = []

  def initialize(make, model)
    @make = make
    @model = model
    @@cars << self
  end

  def self.all
    @@cars
  end
end
```

So, whenever we create a new instance of the class, it pushes itself onto a class-level array. Calling Car.all will return an array containing all instances that have been created. Pretty awesome, right?
