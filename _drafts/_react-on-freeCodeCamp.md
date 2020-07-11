# freeCodeCamp: React

Highly recommend this as a way to get familiar w/ React.

* [freeCodeCamp: React Exercises](https://www.freecodecamp.org/learn/front-end-libraries/react/)
* [Search React Docs](https://www.google.com/search?q=bind+this+site%3Areactjs.org%2Fdocs)

## Props

When using a component, JSX/HTML attributes are passed into the component via
the `props` object.

```jsx
{/* component use */}
<App>
  <Welcome user='Mark' />
</App>
```

```jsx
// component definition
const Welcome = (props) => <h1>Hello, {props.user}!</h1>

// w/ object destructuring
const Welcome = ({ user }) => <h1>Hello, {user}!</h1>
```
