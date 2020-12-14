---
layout: post
title: "make and Makefiles"
categories: cheatsheet
---

> The `make` program is intended to automate the mundane aspects of transforming
> source code into an executable. You can specify the relationships between the
> elements of your program, and it knows exactly what steps need to be redone to
> produce the desired program.

> The specification file, or `Makefile`, describes the relationship between the
> source, intermediate, and executable program files so that `make` can perform
> the minimum amount of work necessary to update the executable.

[source](https://www.oreilly.com/openbook/make3/book/index.csp)


## A simple Makefile example

```c
#include <stdio.h>

int main() {
  printf("Hello world");
  return 0;
}
```

```Makefile
hello: hello.c
    gcc hello.c -o hello
```

```bash
$ make
```

## A generic Makefile example

```Makefile
target: prereq1 prereq2
    commands
```

- `target` - The thing you want to do. (e.g. - run tests, build, create a database)
- `prereq` - The thing(s) that needs to be done before running the commands.
- `commands` - Shell commands that achieve the desired result.

## Satisfying Prerequsites

>
1. The target must exist.
2. The target’s timestamp must be newer than the timestamp of the target’s prerequisites.
3. The prerequisite targets must be satisfied.

[blog.mindlessnes.life/makefiles](https://web.archive.org/web/20191123215706/https://blog.mindlessness.life/makefile/2019/11/17/the-language-agnostic-all-purpose-incredible-makefile.html)

## Why use a Makefile?

>
[...] nowadays every project I create has a Makefile to bind together all task
involved on that project. From bootstrapping the dev environment,
running checks/test, starting a devserver, building releases and container
images. Makefiles are just such a nice place to put scripts for these common
tasks compared to normal shell scripts.

[aeuquitas on hacker news](https://news.ycombinator.com/item?id=19900955)

## Resources

* [example makefile](https://gitlab.com/internet-cleanup-foundation/web-security-map/blob/master/Makefile)
* [Makefile Tutorial](https://makefiletutorial.com/)
* [Notes for new Make users](https://web.archive.org/web/20191123215356/http://gromnitsky.users.sourceforge.net/articles/notes-for-new-make-users/)
* [GNU Make Manual](https://www.gnu.org/software/make/manual/)
* <https://blog.melski.net/2015/01/07/howto-intro-to-gnu-make-variables/>
* <https://blog.melski.net/2010/11/15/shell-commands-in-gnu-make/>
* [Analysis of GNU Make Feature Use](/assets/docs/MCAA_ICPC15_Makefiles.pdf)
