---
layout: post
title: "Python Development on OSX"
date: 2015-05-20 04:30
tags: python pyenv
---

# Python Development

## Install pyenv

pyenv manages Python versions

```
brew install pyenv
```

Add the following to your `.bashrc` or `.zshrc` file.

```
export PYENV_ROOT="/usr/local/opt/pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
```

## Install Python

```
pyenv install 2.7.9
pyenv install 3.4.3
```

## Set the Python Version for a project

```
echo 2.7.9 > .python-version
```

## Managing Project Dependencies

`requirements.txt` is similar to the Ruby Gemfile

```
# requirements.txt
--index-url https://pypi.python.org/simple/

python-dotenv==0.1.2
Django==1.8.1
```

Install project dependencies

```
pip install -r requirements.txt
```

Upgrade dependencies

```
pip install -r requirements.txt --upgrade
```

## Debugging

Pause execution and REPL

```
import pdb
pdb.set_trace()  # exit() when finished
```

View methods on an instance

```
dir(instance)
```

## Documentation

```
pydoc -p 9090
open http://localhost:9090
```
