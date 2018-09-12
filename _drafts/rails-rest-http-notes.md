# Rails, REST, and HTTP Notes

Notes for my talk on Tuesday, October 9th, 2018.

## HTTP Request/Response Cycle

![diagram of HTTP request/response cycle](/assets/images/http-request-response-cycle.png)

[source](https://www.quora.com/How-does-the-HTTP-request-and-respond-occur-in-the-client-side-and-server-side-separately)

* Components of a Request: verb, path
* Components of a Response: response code, optional body

## HTTP & CRUD -> REST

verb | action
---- | ------
POST | create
GET  | read
PUT/PATCH | update
DELETE | delete

* posting a post... wtf!??@!

## Rails Tutorial MVC Diagram

![diagram of MVC in Rails](/assets/images/rails-tutorial-mvc-diagram.png)

[source](https://www.railstutorial.org/book/toy_app#fig-mvc_detailed)

## Anti-patterns

The stuff you shouldn't do, even if it works.

* Naming public controller methods something other than index, new, create, edit, update, show, or destroy.
* Deviate from the RESTful definitions of HTTP verbs
  - GET -> read resource
  - POST -> create resource
  - PUT/PATCH -> update resource
  - DELETE -> "delete" resource
