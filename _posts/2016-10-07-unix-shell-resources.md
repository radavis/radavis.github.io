---
layout: post
title: "UNIX Shell Resources"
date: 2016-10-20 10:00
tags: bash
---

I count **shell scripting** and **SQL** as two skills that will never go out of date. Both have been around since the early 1970s, and I don't see either being replaced anytime soon. Spend your time learning these technologies, and you will have an excellent return on investment.

Here are some of what I consider to be the best resources for learning the magical spells you can cast at the command prompt.


# UNIX for the Beginning Mage - Joe Topjian

[UFBM](http://unixmages.com/ufbm.pdf) is focused on teaching you how to effectively navigate the UNIX Shell.


# Up and Running with Bash Scripting - Scott Simpson

This
[course on Linda.com](https://www.lynda.com/Bash-tutorials/Up-Running-Bash-Scripting/142989-2.html)


Linda.com access is free to [Boston Public Libray card holders](https://www.bpl.org/kbl/2015/12/08/lynda-com-is-live).


# UNIX for Mac OS X Users - Kevin Skoglund

Another [course on Linda.com](https://www.lynda.com/Mac-OS-X-10-6-tutorials/Unix-for-Mac-OS-X-Users/78546-2.html)


# Other Stuff

* [Unix as IDE](https://sanctum.geek.nz/arabesque/series/unix-as-ide/)
* [Awesome Bash](https://github.com/awesome-lists/awesome-bash)
* [Awesome Shell](https://github.com/alebcay/awesome-shell)

# Syntax Highlighting in nano

```no-highlight
$ brew tap homebrew/dupes
$ brew install nano
```

Add `include /usr/local/share/nano/*.nanorc` to `~/.nanorc`.

# Update Bash

```no-highlight
$ brew install bash
```

[Bash Homepage](http://tiswww.case.edu/php/chet/bash/bashtop.html)

# Basic Commands

```no-highlight
pwd
ls
ls -l folder_name
mkdir folder_name
rmdir folder_name
clear
cd folder_name
cp filename new_filename
rm filename
cat filename
more filename
head filename
tail filename
```

# Expansions

```no-highlight
cd ~
cd ~-
touch {file_one,file_two,file_three,file_four}
echo {01..100}
```

# Pipes and Redirection

`|` - pipe the output of one command to the input of another
`>` - redirect output
`1` - stdout
`2` - stderr
`&` - stdout & stderr

```no-highlight
ls | more
cp -v * ../otherfolder 1>../success.txt 2>../error.txt
cp -v * ../otherfolder &>../log.txt
grep -i break-in auth.log | awk {'print $12'}
sed
ping -c 1 example.com | grep 'bytes from' | cut -d = -f 4
```

# Create Bash Scripts

```no-highlight
#!/bin/bash
# my.sh
ls
```

```no-highlight
chmod +x my.sh
```

# Variables

```no-highlight
#!/bin/bash
greeting_one=Hello
greeting_two="Good Morning"
age=35

echo $greeting_one, $greeting_two, $age

declare -i thing_one=123  # thing_one is an integer
declare -r thing_two=456  # thing_two is read-only
declare -l datatype="String"  # to lowercase
declare -l datatype="String"  # to uppercase

echo $HOME
echo $PWD
echo $MACHTYPE
echo $HOSTNAME
echo $BASH_VERSION
echo $SECONDS
echo $0  # name of the script
```

[Bash Variables](http://tldp.org/LDP/abs/html/internalvariables.html)


# Command Substitution

```no-highlight
#!/bin/bash
current_directory=$(pwd)
echo $current_directory

response_time=$(ping -c 1 example.com | grep 'bytes from' | cut -d = -f 4)
echo "The response time was $response_time"
```


# Strings

```no-highlight
a="hello"
b="world"

c=$a$b      # concatenation
echo ${#a}  # length
d=${c:3}    # substring
d=${c:3:4}  # substring

# find/replace
fruit="apple banana banana cherry"
echo ${fruit/banana/durian}
echo ${fruit//banana/durian}

echo ${fruit/#apple/durian}
echo ${fruit/%cherry/durian}
echo ${fruit/c*/durian}
```


# Math in Bash

Wrap expressions in double parenthesis: `(( 5 + 3 ))`
Variable assignment: `result=$(( 5 + 3 ))`

| Operation      | Operator |
| -------------- | -------- |
| Exponentiation | $x ** $y |
| Multiplication | $x * $y  |
| Division       | $x / $y  |
| Modulo         | $x % $y  |
| Addition       | $x + $y  |
| Subtraction    | $x - $y  |
| Increment      | $x++     |
| Decrement      | $x--     |

**Warning:** Integer division. Use `bc`

```no-highlight
#!/bin/bash
$one_third=$(echo 1/3 | bc -l)
```

# Comparison Operations for Strings

Use double square brackets when making comparisons: `[[ $x < $y ]]`

* `1` is `FALSE`
* `0` is `TRUE`

| Operation                | Operator |
| ------------------------ | -------- |
| Less than                | $x < $y  |
| Greater than             | $x > $y  |
| Less than or equal to    | $x <= $y |
| Greater than or equal to | $x >= $y |
| Equal                    | $x == $y |
| Not Equal                | $x != $y |
| Is null?                 | -z $x    |
| Is not null?             | -n $x    |


```no-highlight
[[ "zebra" == "zebra" ]]
echo $?  # return value
```


# Comparison Operations for Numbers

| Operation                | Operator   |
| ------------------------ | ---------- |
| Less than                | $x -lt $y  |
| Greater than             | $x -gt $y  |
| Less than or equal to    | $x -le $y  |
| Greater than or equal to | $x -gt $y  |
| Equal                    | $x -eq $y  |
| Not Equal                | $x -ne $y  |


# Logic Operations

| Operation   | Operator |
| ----------- | -------- |
| Logical AND | $x && $y |
| Logical OR  | $x || $y |
| Logical NOT | ! $a     |


# Conditional Statements

```no-highlight
if [[ -a ~/.vars ]]; then
  source ~/.vars
fi
```

# Looping and Arrays

```no-highlight
RubyVersions=( '2.3.1' '2.2.5' '2.0.0-p648' );
for version in "${RubyVersions[@]}"; do
  ruby-install ruby $version
done
```

# Functions

```no-highlight
sms() {
  number=$1
  shift
  curl -X POST http://textbelt.com/text -d number=$number -d "message=$*"
}
```
