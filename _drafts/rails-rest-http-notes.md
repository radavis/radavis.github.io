# Rails, REST, and HTTP Notes

Notes for my talk on Tuesday, October 9th, 2018.

Idea for example application: Movie Catalog App.


## HTTP Request/Response Cycle

![diagram of HTTP request/response cycle](/assets/images/http-request-response-cycle.png)

[source](https://www.quora.com/How-does-the-HTTP-request-and-respond-occur-in-the-client-side-and-server-side-separately)

* Components of a Request: verb, path, optional body
* Components of a Response: response code, headers, optional body
* demo this interaction


## HTTP & CRUD -> REST

verb | action
---- | ------
POST | create
GET  | read
PUT/PATCH | update
DELETE | delete

* posting a post... wtf, man!??@!
* diagram HTTP and its RESTful mapping to CRUD operations
* REST -> A Convention


## Rails Tutorial MVC Diagram

![diagram of MVC in Rails](/assets/images/rails-tutorial-mvc-diagram.png)

[source](https://www.railstutorial.org/book/toy_app#fig-mvc_detailed)

* demo output of `rake routes || rails routes`


## HTTP/Rails MVC Diagram (without JS/wiz)

* diagram the execution of code triggered by an HTTP request
* diagram the components of the stack that can be swapped out (db, view layers)
* importance of naming

## HTTP/Rails MVC Diagram (with JS/wiz wit)

* initial request: HTML & JS
* diagram the execution of code triggered by a JS HTTP request
* JS uses AJAX/fetch to communicate between front-end and back-end
* diagram the components of the stack that can be swapped out (js-frameworks)
* note on complexity: DHH and "double MVC" https://twitter.com/dhh/status/75281941422800896


## Pitfalls and Anti-patterns

The stuff you probably shouldn't do, even if it works.

* Naming public controller methods something other than index, new, create, edit, update, show, or destroy.
* Expose unimplemented routes.
* Deviate from the RESTful definitions of HTTP verbs.
  - GET -> read resource
  - POST -> create resource
  - PUT/PATCH -> update resource
  - DELETE -> "delete" resource


## Takeaways

* Visualize user interaction within your webapp using the combined HTTP/Rails MVC diagram.
* Avoid pitfalls and anti-patterns.
* Stick with conventions, whenever possible.


## Resources

* [Slides](https://docs.google.com/presentation/d/1QGNgdWTNjM9_VUcDsbTTN6wvMdWtSwZdjgChCx4yKzw/edit?usp=sharing)
* [Rails Routing](https://guides.rubyonrails.org/routing.html)
* [Rails Tutorial - Hartl](https://www.railstutorial.org/book)
* [REST API Tutorial](https://www.restapitutorial.com/)
