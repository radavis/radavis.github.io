Folder Structure for Node/Express Applications

## Application Development Philosophy

**Release API and front-end code as a single repository/App.** Fewer moving
parts. Work in one repository (instead of multiple) to change API and front-end.

**Environment dictates application behavior.** Application checks if necessary
variables are set, fallback to reasonable defaults.

- `yarn start` - for development (default) and production (`NODE_ENV=production yarn start`)
- `yarn test`

**Minimal divergence between environments.** Development to Deployment. Staging
to Production.

- Use same data storage solutions in dev and prod. (Anti-pattern: sqlite in dev,
  postgres in prod)
- Email: short-circuit in test and staging, point to local mailserver
  (mailcatcher) in dev, point to live mailserver in prod.

**One command to deploy.**

A `git push` is the trigger for CI/CD steps.

- Maintain a 1-to-1 relationship with git branches and environment where code is deployed.
  * build_passing? -> merge to dev branch -> deploy to staging
  * version++ & merge to master branch -> deploy to production

- `git push heroku_production HEAD:master` -> deploy to Heroku PaaS
- `git push origin feature-branch`
  * -> merge triggers CI
  * -> passing CI triggers merge to dev/staging branch
  * -> deploy to staging
- `bundle exec cap staging deploy --trace`
- docker-compose.yml to build and run containers locally (psql, server,
  api, sidekiq, etc...)
- script to increment build version (major.minor.patch+build), publish release,
  set env var dates
- cut a release (merge to master), deploy latest version to production

**Mock external services when testing.** We're not testing sidekiq, we're testing
our code against sidekiq's published API.

**Record database schema and schema migrations in the codebase.**

## Questions

* How does the end-user know what version of the application is running?
* How does the developer know what version of the application is running?
* How do you track the published release of a server? Need a way to match git sha
  to running application.
  - Tag docker image?
  - API path to see app version?
* How does your team deploy your code? Is that process dependent upon a single
  person? (e.g. - If Tim is out, we can't deploy.)

## Possible Solutions

* Store version as application-wide constant in a file. Date of that file determines
  application release date.

## Node/Express API

* Express
* Sequelize
* Posgtres

[source](https://github.com/didinj/node-express-postgresql-sequelize)

```
bin
config
controllers
migrations
models
public
routes
views
```
