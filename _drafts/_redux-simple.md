# A Simple Redux Tutorial

[article](https://outline.com/efqZug)


## Why Redux?

As your Component-based application grows, managing state between parent & child
components can become complex.

![](assets/images/with-redux.png)

With redux...

* the **store** handles state management
* easily trace data flow
* components listen, or `connect`, to the data they are interested in


## Flux Architecture

One-way data flow:

Action -> Dispatcher -> Store -> View

![](assets/images/react-redux-overview.png)

* **action** - an object. `{ type, payload }`
* **reducer** - a function. processes an action, creates a new updated state.
* **dispatch** - a function. sends data to our app. a bridge between an action and a reducer.
