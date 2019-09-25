---
layout: post
title: "make and makefiles"
date: 2019-09-24 23:25
categories: cheatsheet
---

> The `make` program is intended to automate the mundane aspects of transforming
> source code into an executable. You can specify the relationships between the
> elements of your program, and it knows exactly what steps need to be redone to
> produce the desired program.

> The specification file, or `makefile`, describes the relationship between the
> source, intermediate, and executable program files so that `make` can perform
> the minimum amount of work necessary to update the executable.

[source](https://www.oreilly.com/openbook/make3/book/index.csp)


## A simple makefile example

```c
#include <stdio.h>

int main() {
  printf("Hello world");
  return 0;
}
```

```makefile
hello: hello.c
    gcc hello.c -o hello
```

```bash
$ make
```

## A generic makefile example

```makefile
target: prereq1 prereq2
    commands
```
## Why use a makefile?

>
[...] nowadays every project I create has a Makefile to bind together all task
involved on that project. From bootstrapping the dev environment,
running checks/test, starting a devserver, building releases and container
images. Makefiles are just such a nice place to put scripts for these common
tasks compared to normal shell scripts.

- [aeuquitas on hacker news](https://news.ycombinator.com/item?id=19900955)

[example makefile](https://gitlab.com/internet-cleanup-foundation/web-security-map/blob/master/Makefile)
