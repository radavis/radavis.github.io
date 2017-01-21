---
layout: post
title: "React and Redux Cheat Sheet"
date: 2016-09-19 16:30
tags: react
---

Steps for setting up React with the following technologies:

* Sass
* JSX
* ES2015 (ES6) support
* Redux

```sh
$ mkdir shiny-new-project
$ cd shiny-new-project
$ npm init
$ npm install --save react react-dom
$ npm install --save redux react-redux
$ npm install --save-dev webpack webpack-dev-server
$ npm install --save-dev babel-loader babel-core babel-preset-react babel-preset-es2015
$ npm install --save-dev style-loader css-loader sass-loader node-sass
```

```js
// .babelrc
{
  "presets": ["es2015", "react"]
}
```

```js
// package.json
{
  // ...
  "scripts": {
    "start": "webpack-dev-server",
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  // ...
}
```

```js
// webpack.config.js
var webpack = require('webpack');

module.exports = {
  entry: {
    path: './src/main.js'
  },
  output: {
    path: './build',
    filename: 'bundle.js'
  },
  module: {
    loaders: [
      {
        test: /\.scss$/,
        loaders: ["style", "css", "sass"]
      },
      {
        test: /\.jsx?$/,
        exclude: /node_modules/,
        loader: 'babel'
      }
    ]
  },
  plugins: [
    new webpack.HotModuleReplacementPlugin()
  ],
  devtool: 'eval-source-map',
  devServer: {
    contentBase: './build',
    inline: true,
    hot: true
  }
};
```

```js
// src/main.js
import './app.scss';
import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';

ReactDOM.render(
  <App />,
  document.getElementById('app')
);
```

```no-highlight
# .gitignore

node_modules/
```


### Presentational Components

* aka - skinny, dumb, pure, stateless components
* concerned w/ how things look
* don't specify how data is loaded or mutated
* receive data and callbacks exclusively via props
* rarely have their own state
* eg - Page, Sidebar, Story, UserInfo, List


### Container Components

* aka - fat, smart, stateful components
* concerned w/ how things work
* provide data and behavior to presentational components
* call actions and provide these as callbacks to presentational components
* eg - UserPage, FollowersSidebar, StoryContainer, FollowedUserList


### Redux Notes

> The whole state of your app is store in an object tree inside a single store.
> Change the state tree by emitting an **action** (an object which describes what happened).
> Reducers describe how to transform the state tree.

The Three Commandments of Redux

1. There is a single source of truth for the application: **the store**.
2. The store is **read-only**. You may only dispatch actions on the store: `store.dispatch(actionObject)`.
3. The store is transformed by **reducer** functions: `reducer(currentState, actionObject) => newState`.


### The Store

The store holds the state tree of the application. It is an object that
contains a few methods:

* `getState()` - returns the state tree
* `dispatch(actionObject)` - trigger a state change, returns `newState`
* `subscribe(listener)`


### Reducers

Functions that change the state of the application.

* input: `currentState` and `actionObject`
* output: `newState`

As the application grows, separate reducers into smaller functions, and combine
them with `combineReducers`.


### Resources

* [Presentational and Container Components](https://medium.com/@dan_abramov/smart-and-dumb-components-7ca2f9a7c7d0#.nrp5phzbd)
* [Gist explaining stateless and container components](https://gist.github.com/chantastic/fc9e3853464dffdb1e3c)
* [Using Redux with React](http://redux.js.org/docs/basics/UsageWithReact.html)
* [Getting Started with Redux - egghead.io](https://egghead.io/courses/getting-started-with-redux)
* [Simplest Redux + React Example](https://github.com/jackielii/simplest-redux-example)
* [Redux Examples](http://redux.js.org/docs/introduction/Examples.html)
* [Learn React & Redux with Cabin](http://cabin.getstream.io/)
