# `.circleci/config.yml`

Node configuration for CircleCI.

```
version: 2

jobs:
  build:
    docker:
      - image: circleci/node:8.12
    working_directory: ~/repo
    steps:
      - checkout
      - restore_cache:
          keys:
            - v1-dependencies-{{ checksum "yarn.lock" }}
            - v1-dependencies-
      - run: yarn install
      - save_cache:
          paths:
            - node_modules
          key: v1-dependencies-{{ checksum "yarn.lock" }}
      - run: yarn test
```

---

```
version: 2
jobs:
  build:
```

Use v2 of the CircleCI service. (v1 is deprecated)

Create a new job called `build`. The job **must** be called build, in this case.
For more advanced configurations, use
[workflows](https://circleci.com/docs/2.0/configuration-reference/#workflows).

---

```
docker:
  - image: circleci/node:8.12
```

Use the `docker` executor. Specify the docker `image` in which the subsequent
`steps` will be executed.

> CircleCI 2.0 can build the necessary environment by launching as many docker
> containers as needed at once, or it can use a full virtual machine.

[source](https://circleci.com/docs/2.0/configuration-reference/#docker--machine--macosexecutor)

---

```
working_directory: ~/repo
```

The name of the directory in which the following `steps` will be executed.

**Note**: Unnecessary. Defaults to `~/project`

---

```
steps:
  - checkout
  - run: yarn install
  - run: yarn test
```

An alternate format:

```
steps:
  - checkout
  - run:
      name: Install application dependencies
      command: yarn install
  - run:
      name: Run the test suite
      command: yarn test
```

Here, we `checkout` the working branch of application (specified by
`CIRCLE_BRANCH`). Then, install Node packages needed by the application with
`yarn install`. Then, run the test suite with `yarn test`.

If at any point in the process there is an issue or syntax error, CircleCI will
report a failing build.

---

```
- restore_cache:
    keys:
      - v1-dependencies-{{ checksum "yarn.lock" }}
      - v1-dependencies-
- run: yarn install
- save_cache:
    paths:
      - node_modules
    key: v1-dependencies-{{ checksum "yarn.lock" }}
```

The `save_cache` and `restore_cache` steps help to optimize the execution of
this CircleCI job. If dependences have not changed between builds, CircleCI
will not have to duplicate the effort of fetching those dependencies again.

[caching](https://circleci.com/docs/2.0/caching/)
