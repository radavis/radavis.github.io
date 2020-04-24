# Docker by Example


## Example Dockerfile from a node-express app

```Dockerfile
# api/Dockerfile
# use node v10 as the base image
FROM node:10

# install v6 of the node package manager, globally
RUN npm i -g npm@^6

# create and define a working directory
RUN mkdir /app
WORKDIR /app

# add and install the application dependencies
ADD ./package.json .
ADD ./package-lock.json .

RUN npm install

# define the command to be run when we execute this image as a container
# npm run start-dev -> nodemon ./main.js -e js
CMD npm run start-dev
```

In this case, `npm run start-dev` is defined to be `nodemon ./main.js -e js` in
the `package.json` scripts. `nodemon` watches for changes in the filesystem, and
restarts the app when changes are detected. `-e js` says to watch files with a
`.js` extension.

Isn't something missing? Where do our application files come into play?

This is done through volumes defined in the `docker-compose.yml` file.


## Example Dockerfile from a create-react-app based app

```Dockerfile
# web/Dockerfile
FROM node:10

RUN npm i -g npm@^6

RUN mkdir /app
WORKDIR /app

ADD ./package.json .
ADD ./package-lock.json .

# install application dependencies. `npm install` for automated environments
# https://docs.npmjs.com/cli/ci.html
RUN npm ci

# npm run start -> webpack-dev-server --config webpack.config.dev.js
CMD npm run start -- --public=0.0.0.0:8080
```

The common thread with these Dockerfiles:

* Start with a base image
* Install dependencies
* Define the command to be run as a container (e.g. - start the app/service)

`webpack.config.dev.js` defines port as 8001. The default port for webpack is 8080.
Perhaps `--public=0.0.0.0:8080` is overriding this setting.


## Example docker-compose.yml using the resulting images

### The Database Service

```yml
# ./docker-compose.yml
version: "3.2"
services:
  db:
    image: postgres:10
    environment:
      - POSTGRES_DB=hitech_apd
      - POSTGRES_PASSWORD=cms
      - PGDATA=/pgdata
    volumes:
      - type: bind
        source: ./pgdata
        target: /pgdata
        consistency: delegated
    expose:
      - 5432
    ports:
      - 54325:5432
```

The first service we configure is postgres v10. We set environment variables for
the database name, password, and the location for database data to be stored in
the container's filesystem.

Volumes are a way to persist data generated and used by containers. `source` is
where the data will be stored on the host (local) filesystem. `target` is where
the data will be stored within the running container. In this case, we are
persisting postgres data to the local filesystem so that changes to our
application data are persisted between runs of `docker-compose up` and
`docker compose down`.

Expose port 5432 to other services.

Connect port 54325 of the host, to port 5432 of the container. Run the
following command to get a psql prompt:

```bash
$ psql postgres://postgres:cms@localhost:54325/hitech_apd
```

### The API Service

```Dockerfile
# ./docker-compose.yml
services:
  ...
  api:
    build: ./api
    image: cms-eapd/api
    depends_on:
      - db
    environment:
      - PORT=8000
      - DATABASE_URL=postgres://postgres:cms@db/hitech_apd
      - NODE_ENV=development
    volumes:
      - type: bind
        source: ./api
        target: /app
        consistency: delegated
      - /app/node_modules
    ports:
      - 8081:8000
```

`build: ./api` informs docker to build the Dockerfile located at
`./api/Dockerfile`. The resulting image will be named `cms-eapd/api`.

This service is dependent upon the `db` service. This tells Docker to start up
the `api` service after the `db` service has started.

A bind-mount volume is created between the local `./api` folder, and the `/app`
folder within the running container. This concept is somewhat similar to a
sybmolic link within a filesystem. When the source code is changed in `./api`,
those changes are reflected within `/app`, and the running `nodemon` command
knows to restart the server.

`/app/node_modules` is given a volume. Volumes are used to persist data between
runs. Creating a volume for the `node_modules` folder means that if we bounce
the app service, `node_modules` will persist from the previous run, and we won't
need to install dependencies again. I believe this allow us to add dependencies
while developing, and have them persist.

Connect port 8081 of the host, to port 8000 of the container. Access the api
service by visiting paths at `http://localhost:8081`.


### The Web Service

```Dockerfile
# ./docker-compose.yml
services:
  ...
  web:
    build: ./web
    image: cms-eapd/web
    environment:
      - API_URL=http://localhost:8081
    volumes:
      - type: bind
        source: ./web
        target: /app
        consistency: delegated
      - /app/node_modules
    ports:
      - 8080:8001
```

Build `./web/Dockerfile` outputs the `cms-eapd/web` image.

Bind-mount volume `./web` in local filesystem to `/app` within the container.

Connect port 8080 of the host, to port 8001 of the container.

Access the web service at `http://localhost:8080`.
