# `work.log`

## Monday, August 5th, 2019

**MPP**

* Sprint ends, tomorrow
* Pair w/ Tina on code review
* Talk w/ Felix about breaking up designs into more pages


## Friday, August, 2nd, 2019

**MPP**

* Hide New Contract Award form on page load
* Show New Contract Award form on + click
* Delete Contract Award
* Identify Components from Designs and Application

**OTM**

* Scott says the WatchList doesn't work...
  - Setup the database from the api (`npm run db:setup`), instructions in reqworks-api README.md
  - Set the user identifier in the reqworks-app HomeReducerContext
* (During standup) Scott says the WatchList is working...


## Thursday, August 1st, 2019

* Submit Timesheet

**MPP**

* Contract Awards form page


## Wednesday, July 31st, 2019

**MPP**

* Dissect and understand the Mentor Application process, and the Mentor-Protege Agreement process
* Mentor contract_awards types
  - DOD Subcontracts
  - Other Federal Agency Contracts
  - Other Federal Agency Subcontracts
  - DOD Subcontracts Awarded
  - Other Federal Agency Subcontracts Awarded
  - DOD Subcontract Awards to SDBs
  - Other Federal Agency Subcontract Awards to SDBs
* Protege contract_awards types
  - DOD Subcontract Awards
  - DOD Contract Awards
* SDB - Small Disadvantaged Business
* FY - Fiscal Year, October 1st - September 30th
  - FY2020: 10/1/2019 to 09/30/2020
  - FY2019: 10/1/2018 to 09/30/2019
  - FY2018: 10/1/2017 to 09/30/2019

## Tuesday, July 30th, 2019

**MPP**

* Reviewed [PR#49](https://github.com/FearlessSolutions/mpp/pull/49)
* Hackathon, pt. 2
  - Broke large form into smaller chunks
  - Creates savepoints, so that all progress isn't lost
  - Add a template document for collaboration, w/ document upload

**OTM**

* Demo day (missed my turn due to being afk)


## Monday, July 29th, 2019

**MPP**

* Read/Try "Reusable UI components in Rails": https://goiabada.blog/rails-components-faedd412ce19
  - It feels wrong to have so much logic in a view template.
  - Author recommends looking into [Trailblazer Cells](http://trailblazer.to/gems/cells/)
* Evaluate Heroku vs Beanstalk vs EC2
  - Stick with Heroku if MVP iteration speed is a must
  - Move to EC2 if we have the resources for DevOps
* Look into Login.gov
  - Seems like we need to email someone to gain access.

**OTM**

Stories I could work on... Stories are taken, too basic, or not ready.


## Friday, July 26th, 2019

**Other**

* Applied for Baltimore city permits to park a moving container at 4504

**MPP**

* Finished test for completing Mentor Application form
* Broke view partial up into smaller chunks


## Tuesday, July 16th, 2019

**MPP**

* Pushed email configuration branch to "development" server

**OTM**

* Declared branch bankruptcy, rewrote and reopened PR for REQ-104: Watch a requisition
  - [x] POST
  - [x] DELETE
  - [ ] GET - UI not updating at the appropriate time. Make use of `useFetcher`? No tests for it.


## Sunday, July 14th, 2019

**MPP**

* **TODO** Fix `bin/setup`. Tell CircleCI script to use this.
* **TODO** Write Story for Mentor Form Acceptance Test.
* **TODO** Setup pairing session with Chris P., Start POC branch.


**OTM**

* **TODO** Item Watch App
  - Description: CRUD user_items
  - Technology: React, Fetch, useContext, useReducer, & Express
  - [x] Database Schema: users[email, name], items[upc, msrp]
  - [x] GET /users/:user_id/items
  - [x] POST /users/:user_id/items/:item_id
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
    * Just do it w/ Rails: `rails new app-name --api --database=postgresql --skip-bundle --skip-turbolinks --skip-test`


**Other**

* Prep for User Story Workshop on Monday:
  - [x] Read and edit slides
  - [x] Read notes


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
