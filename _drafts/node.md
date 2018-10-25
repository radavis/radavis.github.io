# Node.js

## Install nvm for managing node versions

```
$ curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
```

## Install node

```
$ nvm install 8.12.0
$ nvm install 10.12.0
```

## Set the node version

```
$ echo "8.12" > ~/.nvmrc
```

## Enforce the node version for a project

[source](https://medium.com/@adambisek/how-to-check-minimum-required-node-js-version-4a78a8855a0f)

```
$ npm i -s semver
```

```js
import semver from 'semver';
import { engines } from './package';

const version = engines.node;
if (!semver.satisfies(process.version, version)) {
  console.log(`Required node version ${version} not satisfied with current version ${process.version}.`);
  process.exit(1);
}
```

```json
{
  "name": "my package",
  "engines": {
    "node": "~8.12.0"
  },
  "scripts": {
    "requirements-check": "babel-node checkVersion.js",
    "postinstall": "npm run requirements-check"
  }
}
```

## Find node_modules folders

```
$ find . -name "node_modules" -type d -prune
```
