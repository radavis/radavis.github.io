---
layout: post
title: "NationJS Conference 2018"
date: 2018-12-05 11:00
tags: javascript
---

[[homepage](http://nationjs.com/)]
[[twitter](https://twitter.com/nationjs)]

![schedule](/assets/images/nationjs-2018-schedule.png)


## React Explaining, Explained  - Josh Nelson

[[homepage](https://joshnelson.io/)]
[[github](https://github.com/jpnelson)]
[[twitter](https://twitter.com/nelsonjoshpaul)]

Josh talked about how teaching someone React can help you to understand the technology better, yourself.

Here's the [article](https://dev.to/joshua/react-explaining-explained-1lb8) which his talk was largely based upon.

Mentioned the [You Got This!](https://glitch.com/culture/you-got-this-zine/) Zine.

My takeaway: If you can't explain a concept to a beginner, you don't understand it.


## React, the Future, and You - Jenn Creighton

[[twitter](https://twitter.com/gurlcode)]
[[slides](https://speakerdeck.com/jenncreighton/react-16-the-future-and-you-december-4-2018)]

Jenn talked about changes and features coming in React v16:

* DOM reconciliation with React Fiber
* Deprecation of 'will' lifecycle methods:
  - `componentWillMount`
  - `componentWillRecieveProps`
  - `componentWillUpdate`
* `<Suspense />` components for lazy loading

Jenn's advice for avoiding JS fatigue: Focus on concepts, and less on code.


## Leveling up through Code Reviews - Elisheba Anderson

[[twitter](https://twitter.com/elisheba_lang)]

Elisheba talked about her path to becoming a Software Developer at Geocent, and how code reviews are a way to level up your skills.

Methods Elisheba used to learn before being employed as a Developer:

* side projects
* meetups
* code challenges
* vlogs

Use a linter to avoid unnecessary conversations about code formatting.

My takeaway: Code reviews are a key opportunity for developers to teach and to learn.


## Demystifying the VDOM - Nir Kaufman

[[twitter](https://twitter.com/nirkaufman)]
[[youtube](https://www.youtube.com/results?search_query=nir+kaufman)]

Nir did a livecode of building a React-like component framework from scratch.

The Virtual DOM is just a JavaScript object.

Nir built the following functions, which was enough to build a virtual DOM and render HTML:

* `createElement(type, ...children)`
* `renderNode(node)`
* `render(node, element)`

Nir went on to build a working `Component` class with state in pure JavaScript.

Takeaway: Try rebuilding framework features from scratch to better understand how they work. There is no magic in frameworks.


## GraphQL Backend-for-Frontend with React UI - Chienyi Cheri Hung

[[twitter](https://twitter.com/cyhung)]
[[slides](https://docs.google.com/presentation/d/1HMsfZguCM8Cz5rA6nPBVlG-GCEhSkY-d6q94Z4Dm3nA/edit#slide=id.p)]

Chienyi explained how using a Backend-for-Frontend architecture pattern can create a thinner UI layer, and simplify data fetching and state management in your application. GraphQL makes implementing this architecture pattern easier.

[Backend-for-Frontend](https://samnewman.io/patterns/architectural/bff/) architecture as described by Sam Newman.


## Building Decentralized Apps with React and Sold - Sean McBride

[[github](https://github.com/bushidocodes)]
[[twitter](https://twitter.com/bushidocodes)]
[[slides](https://docs.google.com/presentation/d/1vlya72jCiMPsPOd-YQBQm4RYc1u_QYEU8hThm74rFCo/edit#slide=id.p1)]
[[app](https://github.com/bushidocodes/nationjs-solid)]


## Managing Reusable Logic in React - Valerie Woolard Srinivasan

[[twitter](https://twitter.com/valeriecodes)]

Valerie discussed ways to share code between React components, in a storybook format.

* mixins
* higher-order components
* render props
* decorators
* container components
* hooks


## Real-time Networked Multiplayer Games with React - Mike Lazer-Walker

[[homepage](http://lazerwalker.com/)]
[[twitter](https://twitter.com/lazerwalker)]

Mike talked about building games in React. Slow, UI-based games work best, based on the constraints of the framework. Store a single source of truth of the game-state on one client, or a central server. Use Websockets for transmitting data.


## Translating React - Jennifer Wong

[[github](https://github.com/jennz0r)]

Jennifer gave a tour of the [React codebase](https://github.com/facebook/react).

Mentioned that [The Beginner's Guide to React](https://egghead.io/courses/the-beginner-s-guide-to-react) is a good starting point for learning the library.


## Demystifying React Performance - Steve Kinney

[[slides](https://speakerdeck.com/stevekinney/react-performance)]

Steve gave an entertaining talk about Performance, with the central theme being: "Doing less stuff takes less time."

* Determine your performance benchmark.
* Measure before you make changes.
* Favoring performance tuning over adding business value isn't a great strategy.
* Lazily load code, when possible.
* Use babel plugins for transpiling more performant code.


## Videos

Assuming videos of the conference will end up, [here](https://www.youtube.com/playlist?list=PLeGxIOPLk9EKwuHQQP431OKGWm6iwPBfR).
