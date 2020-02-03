# Pivotal Cloud Foundry

**Goal**: create a small webapp backed by a database, with necessary services
defined within the repository, configured by credhub, deployed to Pivotal CF.

**Alternative Goal**: Configure Vault to pass secrets to CredHub.

## Prerequisites

* Java 1.8
* MySQL


## Generate a new Spring Boot app via the command line

Install the `springboot` CLI tool. [docs][springboot-cli-macos-install]

```bash
# macOS
brew tap pivotal/tap
brew install springboot
```

View the options for generating a new Spring Boot app

```bash
spring init --list
```

Initialize a new Spring Boot application. [docs][springboot-cli-init-app]

```bash
spring init \
  --dependencies=web,data-jpa,mysql,lombok,flyway \
  --groupId=org.fearless \
  --type=gradle-project \
  recordstore
```

## Create a Database and a User in MySQL

```bash
$ mysql
mysql> create database albums_development;
mysql> create user 'albums-admin'@'localhost' identified by 's3cR3+';
mysql> grant all privileges on 'albums_development'.* to 'albums-admin'@'localhost';
mysql> flush privileges;
mysql> \q
```

## Configure your Database Connection

```
# src/main/resources/application.properties
spring.jpa.hibernate.ddl-auto=none
spring.datasource.url=${DATABASE_URL}
```

```
# .env
DATABASE_URL=jdbc:mysql://localhost:3306/albums_development
```

```
# .gitignore
.env
```

## Create a Database Migration

```
touch src/main/resources/db/migration/V$(TZ=UTC date "+%Y%m%d%H%M%S")__Create_Albums_Table.sql
```

## Add Gradle Plugin for Flyway migrations

[docs][flyway-gradle-plugin]

```gradle
# build.gradle
plugins {
    id 'org.flywaydb.flyway' version '6.1.4'
}
```

## View Gradle Tasks

```bash
./gradlew tasks --all
```

## Install the Pivotal Cloud Foundry (PCF) Command Line Interface (CLI)

```
brew install cloudfoundry/tap/cf-cli
```

## Login to PCF via the command line

```
cf login \
  -a API_URL \
  -u USERNAME \
  -p PASSWORD \
  -o ORG \
  -s SPACE

cf login \
  -a api.run.pivotal.io \
  -u rdavis@fearless.tech \
  -o com.loderunners \
  -s development
```

## Add a MySQL instance to the PCF Space

```
cf create-service cleardb spark mysql
```

So, this creates a mysql instance. What are the connection details?

## Push your app

```
cf push albums-api
```

## Credhub

[docs](https://docs.pivotal.io/credhub-service-broker/using.html)

```
cf create-service credhub default credhub
```

**Note**: Credhub is not a typical service paired with Pivotal Web Services (PWS).
Credhub is specific to the Pivotal "Platform", or Pivotal Cloud Foundry (PCF).


## Resources

[springboot-cli-macos-install]: https://docs.spring.io/spring-boot/docs/current/reference/html/getting-started.html#getting-started-homebrew-cli-installation
[springboot-cli-init-app]: https://docs.spring.io/spring-boot/docs/current/reference/html/spring-boot-cli.html#cli-init
[flyway-gradle-plugin]: https://flywaydb.org/documentation/gradle/
