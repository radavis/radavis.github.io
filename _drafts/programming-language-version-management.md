# Programming Language Version Management

As a developer, it is typical that you will need to work with many languages, as well as 
many different releases of those programming languages.

Here are my preferred Version Management Tools that I use in my development environment.


## Ruby: chruby and ruby-install

### Installation

```
$ brew install chruby ruby-install  # or wget install script & execute
$ ruby-install ruby-2.5.1  # install other versions, once complete
```

### Switch Version in current shell session

```
$ chruby ruby-2.5.1
```

### Switch Versions per project

```
$ echo "ruby-2.5.1" > ~/code/my-project/.ruby-version
```

[[chruby homepage](https://github.com/creationix/nvm)]

[[ruby-install homepage](https://github.com/postmodern/ruby-install#readme)]

[[ruby homepage](https://www.ruby-lang.org/en/)]


## Node: nvm 

### Installation

```
$ brew install nvm  # or curl and execute install script
$ nvm install node  # or v8.11.2
```

### Switch Version in current shell session

```
$ nvm use v8.11.2
```

### Switch Version per project

```
$ echo "8.11.2" > ~/code/my-project/.nvmrc
```

[[nvm homepage](https://github.com/creationix/nvm)]



## Python: pyenv


### Installation

```
$ 
```

### Switch Version in current shell session

```
$ 
```

### Switch Version per project

```
$ 
```


[[pyenv homepage](https://github.com/pyenv/pyenv)]
