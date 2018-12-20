# Peer Code Review

> Debugging is twice as hard as writing the code in the first place. Therefore,
> if you write the code as cleverly as possible, you are, by definition, not
> smart enough to debug it. - Brian Kernighan

In order to minimize our [Bus Factor](https://en.wikipedia.org/wiki/Bus_factor),
and to ensure that features in our codebase can be understood by more than one
developer, we practice peer review for all pull requests.

* All pull requests must be reviewed and understood by another developer.
* When opening a pull request, please cite the Jira ticket number, and write some
annotations giving the reviewer some context to the changes you made and why.
* When the intention of a pull request is not clear, ask the author to pair on
reviewing the code.


## What makes a good Pull Request?

Some of the components of a well crafted PR are as follows:

* **It follows a style guide**. Either the style guide indicated by the
  repository, or, if there was none specified, the pull request follows the
  community style guide for the language. To avoid conversations on styling,
  add a [linter](https://en.wikipedia.org/wiki/Lint_(software)) to your codebase.

* **It follows conventions**. Is the code organized a certain way, with one
  class per file? Is there a test suite? We should try to follow the conventions
  laid out by previous developers.

* **It is well documented**. As contributors, we should take the time to describe
  our changes to the codebase in the notes of our PR, as well as document any
  changes in the README or a [changelog file](http://keepachangelog.com/).

* **It adds one feature**. Typically, we want to keep a pull request scoped to
  one singular feature. This might involve touching or creating multiple files.
  The main idea being that the collection of changes in the pull request are
  all related and relevant to the goal at hand.


## What makes a good Pull Request Review?

When leaving comments on a PR, we want to be careful of our tone. It's easy to
come off as being harsh or annoyed when asking someone to adhere to the
"spaces over tabs" convention. Here are some tips to follow when leaving a
code review:

* Try to **use praise and criticism, equally**. Leave positive comments when you
  see something impressive, or learned about a method you didn't know before
  reviewing the PR.

* **Leave links to relevant documentation** if there is a better process or
  preferred way to do something. eg-

  > I see you are using an `.each` block to build a new array. Check out the
  > `.map` method. It's one of my favorite methods!
  > <http://ruby-doc.org/coreArray.html#method-i-map>

* **Leave clear and specific comments on what needs to be changed** so that the
  PR can be corrected and merged into the codebase.


## Resources and Further Reading

* [Best Practices for Code Review - SmartBear](https://smartbear.com/learn/code-review/best-practices-for-peer-code-review/)
* [Code Review Best Practices - NYU Center for Data Science](https://nyu-cds.github.io/effective-code-reviews/02-best-practices/)
