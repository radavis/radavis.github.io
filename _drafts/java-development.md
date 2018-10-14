# Java Development

## Install

Instructions for managing multiple Java versions, [here](https://stackoverflow.com/a/29195815/2675670).

* install `jenv`
* install Java versions (e.g. - 1.6, 1.8, 10.0, ...)
* add Java versions to `jenv`

## List installed Java versions

```
$ /usr/libexec/java_home -V
```

## Set default Java version

```
$ echo "1.8" > ~/.java-version  # and restart terminal app
$ java -version
```

## Install `jenv` plugins

```
$ brew install gradle
$ jenv enable-plugin gradle
$ brew install springboot
$ jenv enable-plugin springboot
```

## Create a new project

```
$ spring init --build=gradle --java-version=1.8 --dependencies=web,data-jpa spring-project-name
```

## Spring Shell

```
$ spring shell
```

## jHipster

Quick-start instructions:

```
$ npm i -g generator-jhipster
$ mkdir new-app && cd new-app
$ jhipster
$ # model entities w/ JDL Studio
$ jhipster import-jdl jhipster-jdl.jh
```

## Spring Roo

[github](https://github.com/spring-projects/spring-roo)

Allows you to generate applications from the command line.

```
$ brew install roo
```

## Resources

* [PresentationDomainDataLayering](https://martinfowler.com/bliki/PresentationDomainDataLayering.html)
* [Domain-Driven Design and Spring](http://static.olivergierke.de/lectures/ddd-and-spring/)
* [Spring Tools for VSCode, Eclipse, and Atom](https://spring.io/tools)
* [Northwind Traders Database](http://www.geeksengine.com/article/northwind.html)
* [Generate Spring Boot Apps Using Roo](https://dzone.com/articles/how-to-generate-spring-boot-applications-using-spr)
* [Apache Felix](http://felix.apache.org/)
* [OSGi](https://www.osgi.org/developer/what-is-osgi/)
* [cli-spring-boot-scaffold](https://github.com/NetoDevel/cli-spring-boot-scaffold)
* [okta - CRUD App w/ Angular 5 and Spring Boot 2](https://developer.okta.com/blog/2017/12/04/basic-crud-angular-and-spring-boot)
* [jHipster](https://www.jhipster.tech/)
* [SDKMAN](https://sdkman.io/) - could be a better option than jenv and homebrew
