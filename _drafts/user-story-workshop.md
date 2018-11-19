---
layout: post
title: "bash set -x"
date: 2018-11-15 11:00
tags: user-stories
categories: scrum
---

## Software Goals: Questions

When building software, what are some of the goals we would like to achieve...

* from the client's (or product owner's) perspective?
* from the development team's perspective?


## Software Goals: (Possible) Answers

The Client wants software delivered on time and within budget that satisfies the needs of the user base.

The Development Team wants to work in parallel to build robust, useful, and beautiful software.

**User Stories** are a tool we can use to address the needs of both the Client and the Development Team.


## Basic Format

```
As a [role or persona],
I want [a feature],
So that [a business need is satisfied].
```


## Practice

Write User Stories for the following scenarios:

* An independent gym owner who wants to enroll members electronically.
* An acquaintance approaches you to build a digital version of their favorite board game.
* A restaurant owner who owns a few restaurants within a small geographic region,
  and wants a mobile application with a map to allow customers to make reservations.


## Specific Examples

OK (Possibly a good Epic)

```
As a Manager,
I want to view a list of my Employees,
So that I can manage my people.
```

Better

```
As a Manager within the US Government,
I want to view a list of my Non-Compliant Employees,
So that I can take action and bring them back into compliance.
```

Best

```
As a Manager of The X-Files department within the FBI,
I want to view a list of my Employees that are non-compliant with Extraterrestrial Autopsy Training,
So that I can help them schedule a training session and bring them back into compliance.
```


## A Good User Story

A good User Story answers the following questions (for the developer):

* Who am I building this for?
* What functionality am I building?
* What business value am I adding to the application?


## A Good User Story

A good User Story has the following attributes:

* It can be understood by both developers and non-technical stakeholders.
* It is small enough in scope that it can be completed by a developer or a pair within one sprint. (The smaller, the better, typically.)
* It is independent of other user stories in the sprint. (No stepping on each other's toes.)


## Acceptance Criteria

> Acceptance criteria define the boundaries of a user story, and are used to
> confirm when a story is complete and is working as intended.

[source](https://www.boost.co.nz/blog/2010/09/acceptance-criteria)

In other words, we should be able to use the Acceptance Criteria as a checklist
to determine if a feature is functionally complete.

e.g.

* A manager is logged in to the application.
* The manager sees a list of employees they manage.
* Non-compliant employees are at the top of the list with a red 'X'.
* Compliant employees are listed at the bottom of the list with a green checkmark.


## The Path from Idea to Software

[The Path](https://gist.github.com/radavis/9bafb2930fa3f6f9e441782cf7631250)

1. User Story
2. Acceptance Criteria
3. Feature Test


## User Stories + Designs: Going from simply functional software to beautiful software

Designs help to shape client expectations as to how software will look and behave.

Designs help to scope and break down developer work into UI components.
