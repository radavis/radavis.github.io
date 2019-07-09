# React Patterns

## `bind()` vs. Class Method Arrow Functions

[source][codeburstio-react-antipatterns]

Use arrow functions to define `onClick()`, `onChange()`,
and other [on-event handlers][mdn-js-event-handlers], to avoid explicitly
binding class methods in the component constructor.

```js
// explicitly bind the updateValue class method
class app extends Component {
  constructor(props) {
    super(props);
    this.state = {
      name: ''
    };
    this.updateValue = this.updateValue.bind(this);
  }

  updateValue(event) {
    this.setState({
      name: event.target.value
    });
  }

  render() {
    return (
      <form>
        <input onChange={this.updateValue} value={this.state.name} />
      </form>
    )
  }
}
```


```js
// implicitly bind the updateValue class method
class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      name: ''
    };
  }

  updateValue = (event) => {
    this.setState({
      name: event.target.value
    });
  }

  render() {
    return (
      <form>
        <input onChange={this.updateValue} value={this.state.name} />
      </form>
    )
  }
}
```

## Keys and Lists of Components

[source][reactjs-docs-lists-and-keys]

> Use a string that uniquely identifies a list item among its siblings.
> Use the item index as a key as a last resort. Most often you would use IDs
> from your data as keys.

## Resources

* [React Patterns](https://reactpatterns.com/)
* [chantastic/react-patterns](https://github.com/chantastic/react-patterns)
* [React Bits](https://vasanthk.gitbooks.io/react-bits/)
* [Simple React Patterns](https://lucasmreis.github.io/blog/simple-react-patterns/)
* [Patterns for data fetching in React](https://blog.logrocket.com/patterns-for-data-fetching-in-react-981ced7e5c56/)
* [React pattens you should know](https://medium.com/@joomiguelcunha/react-patterns-you-should-know-da86568372fa)
* [React: Design Principles](https://reactjs.org/docs/design-principles.html)

[codeburstio-react-antipatterns]: https://codeburst.io/how-to-not-react-common-anti-patterns-and-gotchas-in-react-40141fe0dcd?gi=b63f9814f3c1
[mdn-js-event-handlers]: https://developer.mozilla.org/en-US/docs/Web/Guide/Events/Event_handlers
[reactjs-docs-lists-and-keys]: https://reactjs.org/docs/lists-and-keys.html#keys
