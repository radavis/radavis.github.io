---
layout: post
title: "Generate Fullstack JavaScript App"
date: 2018-09-24 10:00
tags: javascript
---

## generator-fullstack-vue

[npm page](https://www.npmjs.com/package/generator-fullstack-vue)

```
$ npm install -g yo bower generator-fullstack-vue
$ yo fullstack-vue
```

### Tech

* Vue 2.0
* vue-router
* vuex
* express

### Notes

Gives you quite a lot out of the box: unit & e2e tests, api, models, etc.
However, there could be some improvements: no new versions published in 2 years,
no options for generating restful routes, views, etc. This would be better if
you could simply clone this project from a git source.


## create-react-app

[github page](https://github.com/facebook/create-react-app#creating-an-app)

```
$ npx create-react-app my-react-app
$ cd my-react-app
$ npm start
```

### Notes

Gives you a barebones react app. No testing or models or anything extra provided.


## meteor

[homepage](https://guide.meteor.com/)

```
$ curl https://install.meteor.com/ | sh
$ meteor create simple-todos
```
