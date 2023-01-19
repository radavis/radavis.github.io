---
layout: post
title: "Notes on The Art of Unix Programming"
date: 2018-03-13 17:15
tags: unix
---

[The Art of Unix Programming](http://www.catb.org/esr/writings/taoup/html/)

## Related Books

* _The Unix Programming Environment_ - Kernighan, Pike 1984
* _The Unix Philosophy_ - Gancarz
* _The Pragmatic Programmer_ - Hunt, Thomas
* _The Practice of Programming_ - Kernighan, Pike 1999
* _Zen Flesh, Zen Bones_ - Reps, Senzaki
* _Design Patterns: Elements of Reusable Object-Oriented Software_
* _The Unix Hater's Handbook_ - Garfinkel

## man Pages

```no-highlight
munger(1)
```

Program name: munger
Man Page Section: 1

### Sections

1. User Tools
2. C System Calls
3. C Library Calls
5. File Formats and Protocols
8. System Administration Tools

### Configuration

Lives at `/private/etc/man.conf`. Override with the `-C` flag.

### Commands

```
$ whatis program-name
$ apropos
```

## "Old-school" Unix

* Pre 1985
* Expensive computers which were a shared resource
* Proprietary Unixes
* C and Shell Scripting

## "New-school" Unix

* Post 1990
* Scripting languages
* GUIs
* Open-source Unixes
* The Web

## Case Studies

* cdrtools/xcdroast
* fetchmail
* GIMP

## Culture

Culture and tradition are a part of every profession. This knowledge is passed down from Senior to Junior, outside of textbooks and technical documentation.

## Durability

Unix:
  * Born in 1969. Used in production ever since. Runs on practically anything.
  * Built on C, _the_ language of system programming.
  * Introduced the tree-shaped filesystem
  * Introduced the pipeline for connecting output of one program to the input of another.
  * "50% of your software knowledge becomes obsolete every 18 months". This truth does not hold for Unix.

## Designers

  * Ken Thomposn
  * Dennis Ritchie
  * Brian Kernighan
  * Doug McIlroy
  * Rob Pike

## The Case against Learning Unix Culture

  * Original application: general-purpose timesharing system for large computers
  * Probably won't ever achieve success in the Business Desktop market
  * Users know as "a cult religion of freaks and losers".
  * "Too useful to die, too awkward to break out of the back room."

## Problems with Unix

  * Files have no structure above byte level
  * File deletion is irrevocable
  * Primitive security model
  * "Botched" job control
  * X Windowing System delegates look and feel to the application
  * Multiple shells
  * Designed for technical users
  * "Mechanism, not policy" approach. Which leads to frustration for non-technical end users. (too many options)

## What Unix Gets Right

  * Open-Source Software
  * Cross-Platform Portability
  * Open Standards
  * Runs the majority of Internet Servers
  * URL concept comes from the Unix idea "one uniform file namespace everywhere"
  * Open-Source Community

## Unix is Fun

  * Developing on other platforms is akin to "kicking a dead whale down the beach."
  * People build entire open-source, production-quality Unix systems as a hobby.

## Philosophy

### Doug McIlroy

1. Make each program do one thing well.
2. Expect the output of your program to become the input of another.
3. Design software to be used early.
4. Use and build tools rather than relying on unskilled help.

"Write programs that do one thing well. Write programs to work together. Write programs to handle text streams, because that is a universal interface."

### Rob Pike

1. Prove where the bottleneck is, then improve for performance.
2. Measure. Then, tune for speed
3. Fancy algorithms are slow when the input is small. Don't get fancy until your input is large.
4. Use simple algorithms and simple data structures until you need something more complicated.
5. Data structures, not algorithms, are central to programming.
6. There is no Rule 6.

### Ken Thompson

"When in doubt, use brute force."

### 16 Rules - Highlights

2. Clarity is better than cleverness.
3. Design programs to be connected to other programs.
10. In interface design, always do the least surprising thing.
11. When a program has nothing surprising to say, it should say nothing.
13. Programmer time is expensive; conserve it in preference to machine time.
15. Get it working before you optimize it.
16. Distrust all claims of "one true way".

## Applying the Unix Philosophy - Highlights

* Complex front ends (UI) should be cleanly separated from complex back ends. (daemon)
* Prototype in an interpreted language before coding in C.
* Mixing languages is better than writing everything in one.
* Be generous in what you accept, rigorous in what you emit.
* Small is beautiful. Write programs that do as little as is consistent with getting the job done.

# History

* Compatible Time-Sharing System (CTSS)
* Multics
* Unix - Developed on a PDP-7 by Ken Thompson

The first running Unix code was brainstormed by three people and implemented by Ken Thompson in two days on an obsolete machine that had been designed to be a graphics terminal for a "real" computer.

Unix was used by the Bell Labs patent department for what was to become word processing.

* Unix to Unix Copy Program - developed at Bell Labs, could copy software and mail. Support for Usenet (distributed BBS) was added after 1981
* TCP/IP released with Berkeley Unix 4.2 in 1983
* 1985
  - Intel's 386 chip released (capable of addressing 4GB)
  - Richard Stallman: GNU manifesto and FSF
  - POSIX standards released

### Larry Wall

* creator of the `patch(1)` utility
* wrote Perl, an open-source scripting language

## Linux

* 1995 Linux + Apache open-source webserver
  - incredibly stable
  - efficient

## The Lessons of Unix History

"When Unix has adhered most closely to open-source practices, it has prospered."

"Low-end/high-volume hardware technology almost always ends up climbing the power curve and winning."
