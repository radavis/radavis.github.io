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
  --groupId=com.loderunners \
  --type=gradle-project \
  albums
```

## Configure your Database Connection

```
# src/main/resources/application.properties
spring.jpa.hibernate.ddl-auto=none
spring.datasource.url=jdbc:${DATABASE_URL}
```

```
# .env
DATABASE_URL=mysql://localhost:3306/albums_development
```

```
# .gitignore
.env
```

## Create a Database in MySQL

```bash
$ mysql
mysql> create database albums_development;
mysql> \q
```

## Create a Database Migration

```
touch src/main/resources/db/migration/V$(TZ=UTC date "+%Y%m%d%H%M%S")__Create_Albums_Table.sql
```

```bash
#!/bin/bash
# filename: bin/create_migration
# usage: ./bin/create_migration Name_of_Your_Migration

migration_name="$1"
migration_path="./src/main/resources/db/migration"
timestamp=$(env TZ=UTC date "+%Y%m%d%H%M%S")
filename="$migration_path"/V"$timestamp"__"$migration_name".sql

echo "creating $filename"
echo "-- $migration_name" > "$filename"
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


## Resources

[springboot-cli-macos-install]: https://docs.spring.io/spring-boot/docs/current/reference/html/getting-started.html#getting-started-homebrew-cli-installation
[springboot-cli-init-app]: https://docs.spring.io/spring-boot/docs/current/reference/html/spring-boot-cli.html#cli-init
[flyway-gradle-plugin]: https://flywaydb.org/documentation/gradle/
