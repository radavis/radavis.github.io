# JavaScript Application Scaffolding

Or, coding by hand in a full-stack world isn't an efficient use of your time.


## Concept

The layers of technology within a web application are primarily concerned with
creating, updating, reading, and deleting data. Why not generate the layers of
code to handle this CRUDding of data within the app? Then, we may modify the
generated code to meet the client's needs.

* json-schema documents describe the data model and data validations
* knex migrations describe the relational database structure
* postgres is the persistent storage for the data
* express api paths define the network endpoints for CRUDding the data
* open-api for documenting the network endpoints for consumers
* redux modules define functions to manipulate client state, and form communicating with the api
* react components define the user interface for manipulating the data


## Resources

* [erikras/ducks-modular-redux](https://github.com/erikras/ducks-modular-redux#ducks-redux-reducer-bundles)
* [fullstackreact/redux-modules](https://github.com/fullstackreact/redux-modules)
* [versent/redux-crud](https://github.com/Versent/redux-crud)
* [Redux Toolkit: Creating Slices of State](https://redux-toolkit.js.org/usage/usage-guide#creating-slices-of-state)
* [Robin Wieruch: How to create a REST API with Express.js in Node.js](https://www.robinwieruch.de/node-express-server-rest-api)
* [Turing: Express, Knex, Postgres](https://backend.turing.io/module4/lessons/express_knex)


## Next Steps

Build proof-of-concept in a modular fashion.

Build an express api, then turn it into a generator.
