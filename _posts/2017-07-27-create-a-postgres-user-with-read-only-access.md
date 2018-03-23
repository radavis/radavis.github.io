---
layout: post
title: "Create A Postgres User with read-only Access"
date: 2017-07-27 11:00
tags: psql
---

```sql
CREATE ROLE readonlyaccount LOGIN PASSWORD 'your-password-here';
GRANT SELECT ON ALL TABLES IN SCHEMA public to readonlyaccount;
GRANT CONNECT ON DATABASE database_name to readonlyaccount;
```
