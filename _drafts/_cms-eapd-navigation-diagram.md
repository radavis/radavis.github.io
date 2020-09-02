## How does a URL work?

https://gist.github.com/radavis/81cfb6f8176f21bbb9c31f29ae4e7e13

## Diagram how the following components work:

- [x] Nav
- ContinuePreviousButtons
- [x] AutoScrollToElement
- [x] Waypoint (ConnectedWaypoint)

## Supporting tech

- react-router
  * when the url matches, display appropriate React component
- redux
  * Single 'data store', or just 'store'. A snapshot of the store represents the 'state' of the app at that given moment.
  * Events that happen in the UI trigger actions (e.g. - `{ type: 'UPDATE_BUDGET', payload }`).
  * Reducers accept `currentState` and action, output `nextState`.
  * `mapStateToProps` maps data in the redux store to component properties.
- connected-react-router
  * connects react-router to the browser `history` api via redux
  * allows us to "tap in to" and affect changes in the brower's location (URL)
