# Fullstack React Notes


## Hello, World (pt. 1)

```html
<div id="root">Loading...</div>
<script src="https://fb.me/react-15.1.0.js"></script>
<script src="https://fb.me/react-dom-15.1.0.js"></script>
```

```js
const MOUNT = document.querySelector('#root');
ReactDOM.render(<div>Hello from React</div>, MOUNT);
```


## Hello, World (pt. 2)

```js
const MOUNT = document.querySelector('#root');
const Hello = () => <div>Hello from React</div>
ReactDOM.render(<Hello />, MOUNT);
```


## props (or Properties)

```js
const MOUNT = document.querySelector('#root');

const Hello = (props) => (
  <div>
    Hello {props.name}
  </div>
)

ReactDOM.render(<Hello name='Richard' />, MOUNT);
```


## Display a list of names

```js
const MOUNT = document.querySelector('#root');

const names = [
  'Richard', 'Laura', 'Kendra', 'Josh', 'Luke'
]

const Hello = ({ name }) => (
  <div>
    Hello {name}
  </div>
)

const App = () => (
  <div className='app'>
    {names.map(name => <Hello key={name} name={name} />)}
  </div>
)

ReactDOM.render(<App />, MOUNT);
```


## React Class Syntax

```js
const MOUNT = document.querySelector('#root');
const { Component } = React

const names = [
  'Richard', 'Laura', 'Kendra', 'Josh', 'Luke'
]

const Hello = ({ name }) => (
  <div>
    Hello {name}
  </div>
)

class App extends Component {
  return (
    <div className='app'>
      {names.map(name => <Hello key={name} name={name} />)}
    </div>
  )
}

ReactDOM.render(<App />, MOUNT);
```

## When to use Class Components or Functional Components?

```js
if (needState || accessToLifecycle) {
  // use class component
} else {
  // use functional component
}
```


## props and Events

Parent components communicate to children through props. Functions passed down
through props are the canonical manner in which children communicate events with
their parent components.


## Binding of `this` in component methods

Typically, you explicitly bind the method context:

```js
constructor(props) {
  super(props);
  this.handleUserAction = this.handleUserAction.bind(this);
}

handleUserAction() {
  // ...
}
```

With the Babel `transform-class-properties` plugin, we can write component methods
as arrow functions, and the binding of context is performed, automatically.

```js
handleUserAction = () => {
  // ...
};
```

Property initializers also allow us to declare component `state` outside of the
constructor method:

```js
state = {
  products: [],
};
```

## Guidelines for Building a React App from Scratch

1. Break the app into Components
2. Build a static version
3. Determine what should be stateful
4. Determine where state should live
5. Hard-code initial states
6. Add inverse data flow
7. Add server communication


## State

In general, we want the parent component to pass props to its stateless children.
In this example, we have this dynamic reversed.

```js
const MOUNT = document.querySelector('#root');
const { Component } = React

const names = [
  'Richard', 'Laura', 'Kendra', 'Josh', 'Luke'
]

class Guest extends Component {
  constructor(props) {
    super(props)

    this.state = {
      rsvpd: false
    }
  }

  toggleActive = evt => this.setState({
    rsvpd: !this.state.rsvpd
  })

  render() {
    const { name } = this.props
    const { rsvpd } = this.state

    return(
      <div
        className={`guest ${rsvpd && 'active'}`}>
        <input
          onChange={this.toggleActive}
          type='checkbox' />
        {name}
      </div>
    )
  }
}

const GuestbookApp = () => (
  <div className='guestbook'>
    {names.map(name => (
      <Guest
        key={name}
        name={name} />
    ))}
  </div>
)

ReactDOM.render(<GuestbookApp />, MOUNT);
```

Left of on ~/Movies/fullstack-react-videos/1_concepts.mov@23:00
