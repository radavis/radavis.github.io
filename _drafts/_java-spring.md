# Java Spring

## Features

* Spring JDBC (Java DataBase Connectivity)
* Spring MVC
* Spring Security
* Spring AOP
* Spring ORM
* Spring Test


### Spring JDBC

Spring JDBC simplifies the interaction between the application layer and the
database layer by handling the following...

* Opening and closing Database connections
* Handling SQLExcpetions
* Transactions
* other boilerplate code that is necessary when communicating with a Database.

Basically, Spring JDBC abstracts away any boilerplate code so we can write and
execute SQL statements against a given Database.

**Spring JDBC classes**

* JdbcTemplate
* NamedParameterJdbcTemplate
* SimpleJdbcTemplate
* SimpleJdbcInsert
* SimpleJdbcCall


### Package javax.persistence

Manages the object/relational mapping.

[Docs](https://javaee.github.io/javaee-spec/javadocs/javax/persistence/package-summary.html)

```java
// src/main/java/app/models
package app.models;

import javax.persistence.*;

@Entity
@Table(name = "aircraft")
public class Aircraft {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String tailNumber;

    @ManyToOne
    @JoinColumn(name = "unit_id")
    private Unit unit;

    public Aircraft(Unit unit, String tailNumber) {
        this.tailNumber = tailNumber;
        this.unit = unit;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    // ...
}
```


### Flyway Database Migrations

[Docs](https://flywaydb.org/getstarted/firststeps/gradle)


### Spring Boot

An extension of Spring that provides a reasonable set of default dependencies
along with configuration. Spring Boot provides these via **Starters**:

* spring-boot-starter-web - includes Tomcat webserver, JSON support, Spring MVC
* spring-boot-starter-data-jpa - includes JDBC, javax.persistence-api, jaxb-api, and Hibernate
* spring-boot-starter-security - authentication and authorization, CSRF protection, etc
* spring-boot-starter-test - includes JUnit, Hamcrest and Mockito

[Complete list of Spring Boot Starters](https://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/#using-boot-starter)
