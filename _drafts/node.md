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

## Find node_modules folders

```
$ find . -name "node_modules" -type d -prune
```
