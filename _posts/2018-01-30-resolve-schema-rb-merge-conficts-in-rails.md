---
layout: post
title: "Resolve Schema Merge Conflicts in Rails"
date: 2018-01-30 13:00
tags: rails databases
---

Normally, you can run `rake db:migrate`, and the problem is solved. Here are
instructions for when that doesn't cut it...

Export a SQL backup from the production database into the local development database.

```bash
$ psql app-name_development < 2018-01-30-app-name.sql  # or mysql, or sqlite3, or whatever
```

Rewrite the `db/schema.rb` file from the local development database.

```bash
$ bundle exec rake db:schema:dump
```

Migrate.

```bash
$ bundle exec rake db:migrate
```
