---
layout: post
title: "Meteor.js"
date: 2018-09-24 10:00
tags: javascript meteor
---

## meteor-cli

[homepage](https://guide.meteor.com/)

```
$ curl https://install.meteor.com/ | sh
$ meteor create simple-todos --full
```

### Structure

```
.meteor/ -> meteor project files
client/  -> client views
server/  -> server api
package.json
```


## iron-meteor

[tutorial](https://scotch.io/tutorials/how-to-speed-up-meteor-development-with-scaffolding-and-automatic-form-generation)

```
$ npm install -g iron-meteor
$ iron create my-app
```

### Structure

```
.iron/ -> iron-meteor project files
app/   -> meteor app
bin/
build/ -> builds of this application
config/ -> environment configuration
```

### Adding/Removing Libraries

```
$ iron remove static-html
$ iron add aldeed:autoform
$ iron add twbs:bootstrap
$ iron add blaze-html-templates
$ iron list  # view installed packages
```

### Scaffolding a Collection

```
$ iron g:collection albums
```

Then, edit the `app/lib/collections/albums.js` file.

* edit the insert, update, remove rules on the mongoDB Collection.
* add a schema for the mondgoDB Collection.
* publish the collection `$ iron g:publish albums`

### Create a Form, Controller

```
$ iron g:template albums/create_album
$ iron g:controller Albums
```

## Resources

* [mongoDB Databases and Collections](https://docs.mongodb.com/manual/core/databases-and-collections/)
* ['Expected <head> or <body> tag' Errors](https://github.com/iron-meteor/iron-cli/issues/256)
