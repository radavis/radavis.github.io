# Spring Boot

## Labs - by Brian Clozel

* [Introduction](https://bclozel.github.io/lectures/spring-boot-lab.html)

## Definitions

Java Persistence API (JPA)

> The Java ORM standard for storing, accessing, and managing Java objects in a
> relational database. - [javaworld](https://www.javaworld.com/article/3379043/what-is-jpa-introduction-to-the-java-persistence-api.html)

Spring Data JPA

> The goal of the Spring Data repository abstraction is to significantly reduce
> the amount of boilerplate code required to implement data access layers for
> various persistence stores. - [docs.spring.io](https://docs.spring.io/spring-data/jpa/docs/current/reference/html/#repositories)

## Layers

![Spring Data JPA Layers](/assets/images/spring-boot/spring-data-jpa.png)

* Controller: Handles HTTP GET, POST, PUT/PATCH, and DELETE (and other) requests.
  - `DispatcherServlet` - aka "Front Controller":
      * maps to the root, by default (e.g. - `GET /`)
      * catches all incoming HTTP requests
      * determines the 'request handler'
      * maps HTTP request path to a controller method
      * execute the controller method (invoke back-end _services_) -> return an object
      * marshall the object (e.g. - Object -> JSON, Object -> HTML)
      * return a HTTP response
  - `@Controller` annotated class
      * `RequestMapping("/resource", method=RequestMethod.{GET,POST,PUT,PATCH,DELETE})` annotated methods
* Service: holds the business logic
* Data Access Layer
  - Entity: The 'model' in MVC architecture. A class with the '@Entity' annotation describes a database table, objects of that class represent rows in that database table.
  - JPA Repository: Provides an `interface` for CRUDing Entities.
* Database Table: The 'persistence layer.'

## Spring "Stereotypes"

Annotating classes with a specific stereotype marks them as fulfilling a particular
role within a Spring Application. Spring autodetects and loads these annotated
classes.

- `@Component` - a (generic) Spring managed component. "Meta-annotations":
    * `@Service` - holds the "business logic" of the application.
    * `@Repository` - A _Data_ Repository, or Data Access Object (DAO). Catches persistence-specific exceptions & rethrows.
    * `@Controller` - Handles HTTP requests, returns HTTP responses. Controllers should be lightweight and call other components in your application to perform actual work.

- `@Configuration` - Contain `@Bean` definition methods. (e.g. - How to initialize a particular )

## What is the Spring IoC container?

> The [Spring Inversion of Control (IoC)] container creates the objects [that make
> up the Spring application], wires them together, configures them, and manages
> their complete life cycle. - Spring Interview Questions

## What is a Bean?

> A bean is an object that is [...] managed by a Spring IoC container. [docs.spring.io](https://docs.spring.io/spring/docs/current/spring-framework-reference/core.html#beans-introduction)

Is a `@Component` also a `@Bean`?... Yes!

- Use the `@Component` annotation for classes that you write.
- Use the `@Bean` method annotation in a configuration class.

`@Bean` annotation indicates that a method produces a bean to be managed by the
Spring Container.

Default scoping for a bean is the **singleton** scope.

[more on bean scopes](https://docs.spring.io/spring/docs/current/spring-framework-reference/core.html#beans-factory-scopes)

## What is a Servlet?  What is a Servlet Container?

> The Java Servlet API is a standard for implementing Java classes that respond
> to [HTTP] requests.
>
> A web container [aka Servlet Container] is responsible for managing the
> lifecycle of servlets, [and] mapping a URL to a particular servlet [...].
>   -- https://en.wikipedia.org/wiki/Java_servlet

## What does `@Autowired` mean?

> Spring's dependency injection wires an appropriate bean into the marked class
> member. - Spring Cheat Sheet

With Dependency Injection, you describe how your objects should be created. The
IoC container wires up your objects for you.

Options for dependency injection:

* Constructor Injection
* Setter Injection
* Interface Injection

[more information](https://www.baeldung.com/spring-autowire)


## `spring-boot-devtools`

* auto-restarts the application when files on the classpath change
* troubleshoot remote applications

## Serving Static Content

Use one of the following folders:

* `/static`
* `/public`
* `/resources`
* `/META-INF/resources`

Configure this via the `spring.resources.static-locations` property.

## A Typical `Application.java` with Spring Boot

```java
package com.example.myapplication;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication  // same as @Configuration @EnableAutoConfiguration
@ComponentScan  // find your beans, auto-magically
public class Application {

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}
```

## Design Patterns Used in Spring

* Singleton Pattern: Singleton-scoped beans
* Factory Pattern: Bean Factory classes
* Prototype Pattern: Prototype-scoped beans
* Adapter Pattern: Spring Web and Spring MVC
* Proxy Pattern: Spring Aspect Oriented Programming support
* Template Method Pattern: JdbcTemplate, HibernateTemplate, etc.
* Front Controller: Spring MVC DispatcherServlet
* Data Access Object: Spring DAO support
* Model View Controller: Spring MVC

## Resources

* [Introduction to the Java Persistence API (Java World)](https://www.javaworld.com/article/3379043/what-is-jpa-introduction-to-the-java-persistence-api.html)
* [Guide to Spring Data JPA (Stack Abuse)](https://stackabuse.com/guide-to-spring-data-jpa/)
* [Declare dependency versions as variables in `gradle.properties`](https://stackoverflow.com/a/58691504/2675670)
* [Structuring Your Code (Spring Boot)](https://docs.spring.io/spring-boot/docs/current/reference/html/using-spring-boot.html#using-boot-structuring-your-code)
* [Testing in Spring Boot (Baledung)](https://www.baeldung.com/spring-boot-testing)
* [Top 100 Albums of the 1990s (Pitchfork)](https://pitchfork.com/features/lists-and-guides/5923-top-100-albums-of-the-1990s/?page=10)
* [Testing (Spring Boot)](https://docs.spring.io/spring-boot/docs/2.2.4.RELEASE/reference/html/spring-boot-features.html#boot-features-testing)
* [HTTP Request-Response Lifecycle in Spring (DZone)](https://dzone.com/articles/lifecycle-of-a-request-response-process-for-a-spri)
* [Spring Controller Request Mapping (Stack Tips)](https://www.stacktips.com/tutorials/spring/how-spring-controller-request-mapping-works-in-spring-mvc)
* [Spring Boot Best Practices](https://www.e4developer.com/2018/08/06/spring-boot-best-practices/)
* [GRASP object-oriented design](https://en.wikipedia.org/wiki/GRASP_(object-oriented_design))
* [Spring Cheat Sheet](https://www.slideshare.net/marekpapis/spring-cheat-sheet)
* [Spring Interview Questions (edureka)](https://www.edureka.co/blog/interview-questions/spring-interview-questions/)
* [Spring Boot Interview Questions (edureka)](https://www.edureka.co/blog/interview-questions/spring-boot-interview-questions/)
* [Spring MVC Interview Questions (baeldung)](https://www.baeldung.com/spring-mvc-interview-questions)
* [Getting Started w/ Spring Boot: Scaffolding and Annotations](https://medium.com/@ragunathrajasekaran/https-medium-com-ragunathrajasekaran-lets-learn-full-stack-development-part2-7986debc485d)
* https://spring.io/guides/gs/accessing-data-mysql/
* http://nomnoml.com/
* https://hub.docker.com/_/nginx
* https://medium.com/@xiaolishen/develop-in-docker-a-node-backend-and-a-react-front-end-talking-to-each-other-5c522156f634
* https://medium.com/@wkrzywiec/how-to-run-database-backend-and-frontend-in-a-single-click-with-docker-compose-4bcda66f6de
* https://spin.atomicobject.com/2019/06/10/docker-compose-local-dev/
* https://medium.com/softonic-eng/docker-compose-from-development-to-production-88000124a57c
* https://runnable.com/blog/a-better-dev-workflow-with-docker-compose
* https://hackernoon.com/efficient-development-with-docker-and-docker-compose-e354b4d24831

## Images

* [HTTP Request Lifecycle](/assets/images/spring-boot/request-lifecycle.png)
* [Spring MVC Model 2](assets/images/spring-boot/spring-mvc-model2.png)
* [Spring MVC Processing Sequence](assets/images/spring-boot/spring-mvc-processing-sequence.png)
* [Spring MVC Workflow](assets/images/spring-boot/spring-mvc-workflow.png)
