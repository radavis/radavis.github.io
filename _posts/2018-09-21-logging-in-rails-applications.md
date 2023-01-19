---
layout: post
title: "Logging in Rails Applications"
date: 2018-09-21 10:00
tags: rails, log
---

## Log levels

From 0 to 5 in severity:

* `debug` - for debugging purposes, only
* `info` - an informative message
* `warn` - this may or may not be an issue
* `error` - this is an issue, but the application can continue running
* `fatal` - this is and issue, and the application should halt
* `unknown` - we don't know (?)

A corresponding `Rails.logger.level` method exists for each of these levels.

## Logging important events in the application

When writing to the log, give the developer some "breadcrumbs" to follow.
Specify the class name and method name that is writing to the log.

```
msg = "[#{self.class.name}##{__method__}] something important happened that we should log."
Rails.logger.info(msg)
```

If you are `rescue`ing, it probably makes sense to log the error, as well.

```
begin
  # some code that might fail
rescue StandardError => err
  Rails.logger.error("[#{self.class.name}##{__method__}] raised an error.")
  Rails.logger.error(err)
  # handle the error
end
```

## Download logs from a remote source using Secure Copy (scp)

```
$ scp -p username@hostname:~/path/to/log/* ~/path/to/log
```

## Searching Logs

The following command will show you three lines before and three lines after any
occurrence of `ClassName`.

```bash
$ cat production.log | grep -B 3 -A 3 "ClassName"
```

## Resources

* [RailsGuides - The Logger](https://guides.rubyonrails.org/debugging_rails_applications.html#the-logger)
* [Heroku - Logging](https://devcenter.heroku.com/articles/logging)
