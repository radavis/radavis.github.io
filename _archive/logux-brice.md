# Brice

* [Workstation Onboarding](https://docs.google.com/document/d/1F8tLNWPqNlM17QOYXzaOcQfav0t716lHf5aZDF86rRg/edit)
* [Database Schema](https://docs.google.com/drawings/d/1yxzVIPyOIPvDo6o3qLQrUy_zCFlgHvNlUTo9IO-5oGg/edit)

## REST API

Brice should expose a rest api for cruding data within IMDS

Why?

  - no one else should have to implement screen scraping IMDS over SOAP
  - do it once, share RESTful read/write access to IMDS
  - multiple implementations will be buggy/error prone
  - layer of proection over IMDS
  - caching layer over IMDS


Problems

  - Authentication/Authorization: which applications will we allow access? App approval process?
  - Documentation: https://reflectoring.io/spring-restdocs/

Idea

* Mongo
* Worker to update records
* Caching layer
    - GET: 
        * record exists and recordAge < staleAge, return record
        * record exists and record recordAge >= staleAge, update
        * no record, request from IMDS
    - POST:
        * perform creation in background
        * ...
    - How is this done in practice?
