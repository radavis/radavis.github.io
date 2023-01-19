---
layout: post
title: "Rails Model, View, Controller, Router architecture"
categories: cheatsheet
---

## Model Methods

[CRUD with ActiveRecord](https://guides.rubyonrails.org/active_record_basics.html#crud-reading-and-writing-data)


## Controller Actions

* new - init a resource
* create - save a resource
* edit - view and edit a resource
* update - save an existing resource
* show - view a resource
* index - view a collection of resources
* destroy - remove a resource


## View Files

```
app/views/[controller_name]/new.html.erb
app/views/[controller_name]/edit.html.erb
app/views/[controller_name]/show.html.erb
app/views/[controller_name]/index.html.erb
```


## Route

```
resources :model_name, only: [:new, :create, :edit, :update, :show, :index, :destroy]
```
