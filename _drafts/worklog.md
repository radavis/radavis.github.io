# `work.log`

## Sunday, July 14th, 2019

**MPP**

* **TODO** Fix `bin/setup`. Tell CircleCI script to use this.
* **TODO** Write Story for Mentor Form Acceptance Test.
* **TODO** Setup pairing session with Chris P., Start POC branch.


**OTM**

* **TODO** Item Watch App
  - Description: CRUD user_items
  - Technology: React, Fetch, useContext, useReducer, & Express
  - [ ] Database Schema: users[email, name], items[upc, msrp]
  - [ ] GET /users/:user_id/items
  - [ ] POST /users/:user_id/items/:item_id
  - [ ] DELETE /users/:user_id/items/:item_id (optional)
  - Question: Can I scaffold these in an Express app?
    * `express-generator`: generates routes and views
    * [Express, sequelize, okta Tutorial](https://developer.okta.com/blog/2018/06/28/tutorial-build-a-basic-crud-app-with-node) - Fuckin' long!
    * [Node.js Boilerplates](https://dev.to/sm0ke/nodejs-starter-javascript-boilerplates-to-start-fast-1024)
  - Question: What do I need?
    * Webserver to serve static assets: (JS/React code, CSS)
    * Web API to CRUD user_items
    * A way to determine the `currentUser()` on the front-end
    * Try [sahat/hackathon-starter](https://github.com/sahat/hackathon-starter)


**Other**

* Prep for User Story Workshop on Monday:
  - [ ] Read and edit slides
  - [ ] Read notes


**TIL** - (Today, I Learned about...)

* [passportjs](http://www.passportjs.org/)


## Friday, July 12th, 2019

Didn't log any hours due to a poor night's sleep and headache.


## Thursday, July 11th, 2019

**MPP**

Goals:

* Observe how Chris P. and Tina work.
* Learn about their strengths and what the want to get better at.
  - Both sound as if they know React at a intermediate level: They can either
  style components well, interact with a Web API using fetch/componentDidMount-
  useEffect, or understand Redux enough to loathe it.
  - JavaScript is a strength of both.
  - Styling is a strength of Tina's.
  - Database planning is a strength of Chris's.
  - Testing is a weakness of both. Both are at a beginner's level.
* What are the commands used to...
  - install dependencies: `bundle && yarn`
  - setup the database: `rails db:setup`
  - start the app: `rails s`
* How do yarn and npm fit in? What purpose do they serve?
  - javascript and css assets are installed via `yarn` into `node_modules`
    * jquery v3.4
    * bootstrap v4.3
    * inputmask
    * popper.js
  - `node_modules` is added to the asset pipeline in `config/initializers/assets.rb`
  - files sourced from `app/assets/{javascripts,stylesheets}/application.{js,scss}`
* Feature walkthrough
  - Sign-up & email notification w/ Devise
  - Use Mailcatcher in Development
  - Mentor Form
* **TODO** Remove turbolinks - add bug report for JS errors in console.


## Wednesday, July 10th, 2019

**OTM**

* Standup
* REQ-104: Watch a requisition

**MPP**

* Retro, Sprint Planning


## Tuesday, July 9th, 2019

**OTM**

* Ceremony Day


## Monday, July 8th, 2019

**Clearance Investigation**

* Meeting w/ Maurice Hicks @ 400 Cathedral, 10AM-Noon

**MPP**

* Added stories to backlog for managing code quality
* Cloned repo/installed ruby & gems/ran test suite
* MPP-119: Configure CI - Ready for review
* Read about cloud.gov:
  - shared-psql v9.4.7, medium-psql v9.6.10
  - redis
  - background workers/jobs?

**OTM**

* Reviewed REQ-109: History table
