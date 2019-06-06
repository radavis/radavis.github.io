# Environment Variables

When building applications, consider the things that might change between
environments the application will run within. What services is the application
dependent upon? e.g. -

  * Does it need to store and retrieve information from a database?
  * Will it send emails?
  * Will it need to store uploaded files?

One of the tenants of a [12-Factor Application](https://12factor.net) is that
the application should be suitable for deployment on cloud platforms.
"Cloud Platforms" means "Web". "Web" means "HTTP". Take some time to review
[the Hyper-text Transfer Protocol](/http), and how it works.

"Web" also means "Linux". "Linux Philosophy" means using ports to expose services.
This allows us to encapsulate a running database server as a URL:

```
protocol://username:password@hostname:port/path
```

We love to build upon existing abstractions. This allows us to move digital
mountains.
