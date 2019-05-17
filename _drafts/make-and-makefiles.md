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
