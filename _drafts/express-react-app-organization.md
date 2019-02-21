# Express/React App Organization


## Why should I care about e2e testing?

* When do you want know that your api and front-end are out-of-sync?
  - In production?
  - In staging?
  - In CI?
  - Under local development/test?


## Questions to Answer

* Describe the code organization.
* What commands do you need to run when developing?
  - Starting the app?
  - Running the test suite?
* What steps does CI/CD need to build, test, and deploy the application?
* What problems might we anticipate when deploying? How complex is the configuration?
* How does the front-end know what protocol/host/port/path to use?
* What are the benefits of this setup?
* What are the drawbacks?


## Current Application: separate api & frontend repositories and servers

**Description**

* **api** - An "Abstraction Layer" that serves up data for the front-end application.
  - express server
  - swagger api/documentation
  - winston/morgan logging
  - mocha/chai/sinon/supertest for testing
* **app**
  - react front-end (via create-react-app)
  - material-ui
  - jest/enzyme/cypress/pa11y for testing and accessibility compliance

**What configuration does it need?**

```
# api .env.example

BASE_PATH=/api                 # because front-end is mounted at the root path in a separate container
CORS_ENABLED=true              # because front-end is hosted at a different host:port
FEEDBACK_URL=""                # customer override for feedback modal in front-end
NODE_ENV=development
HTTP_BASIC_AUTH_ENABLED=true   # for "securing" the app from prying eyes when deploying low-side
HTTP_BASIC_AUTH_USERNAME=admin
HTTP_BASIC_AUTH_PASSWORD=test1234
```

```
# app .env.example

BROWSER=none   # open a browser when running 'npm start': (firefox, google chrome, ie, none)
HTTPS=true     # tell development HTTP server to serve pages over HTTPS
PORT=3000      # tell development HTTP server to run on a specific port
REACT_APP_HTTP_BASIC_AUTH_USERNAME=admin
REACT_APP_HTTP_BASIC_AUTH_PASSWORD=test1234
REACT_APP_API_BASE_URL=http://localhost:8080/api  # because the front-end needs to know where the backend is located

# customer overrides
REACT_APP_ANALYTIC_SCRIPT_LOCATION='./analytic.js'
REACT_APP_CLASSIFICATION=APPLICATION
REACT_APP_CLASSIFICATION_INFORMATION='DERIVED FROM: UNKNOWN, DATE DERIVED: UNKNOWN, DECLASSIFY ON: UNKNOWN'
REACT_APP_DATE_LAST_MODIFIED=1/1/2019
REACT_APP_INFORMATION_OWNER=UNKNOWN
REACT_APP_PAGE_PUBLISHER=UNKNOWN
```

**What commands do you need to run when developing?**

```
cd api && npm start
cd app && npm start
```

```
# api tests
npm run test  # mocha ./tests --recursive  # functional testing
npm run artillery:run  # stress testing

# app tests
npm start
npm run test         # run unit tests (via jest)
npm run cypress:run  # run e2e tests (with api fixtures)
npm run pa11y:run    # run a11y tests (breaks when api is running)
```

**Deployment**

A Docker image for both the api and front-end are pushed to Amazon ECR.

api:

```
docker run \
  --detach \
  --restart always \
  -e HTTP_BASIC_AUTH_USERNAME=admin \
  -e HTTP_BASIC_AUTH_PASSWORD=test1234 \
  -p 8080:8080 \
  $IMAGE_NAME
```

app:

```
# see infrastructure repo for commands. app README is not up-to-date.
```

**Pros of this setup**

* The separation of the client and server code is convenient from a developer's
  perspective.
* Configuration for development is easy: `cp .env.example .env`

**Cons of this setup**

* Configuration for CI and deployment isn't clear or well-documented.
* Easy to forget to run e2e/a11y tests.
* e2e/a11y tests run on CI aren't exercising the entire application.
* HTTP Basic Auth isn't really that useful.
* Running the api and front-end on different servers leads to CORS/other config
  issues which outweigh the benefits. e.g. - scaling front-end & api, separately

**Suggested changes/improvements**

- We could benefit from following the "convention over configuration" principle.
  e.g. - sane, non-breaking defaults
- Have `npm test` run the entire test suite. (unit, e2e, a11y, etc)
- Refactor the application so that e2e tests are hitting the api layer.
- Remove basic auth, add a simple OAuth layer low-side.
- Combine repositories, or have the api serve front-end assets.
