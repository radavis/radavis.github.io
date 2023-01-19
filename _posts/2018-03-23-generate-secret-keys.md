---
layout: post
title: "Generate Secret Keys"
date: 2018-03-23 18:30
tags: api secret-keys
categories: ruby
---


Ever wonder how Rails generates its secret keys stored in `config/secrets.yml`?

It uses the `SecureRandom` library, built into Ruby.

```ruby
# rails/tasks/misc.rake

desc "Generate a cryptographically secure secret key (this is typically used to generate a secret for cookie sessions)."
task :secret do
  require "securerandom"
  puts SecureRandom.hex(64)
end
```

[Source](https://github.com/rails/rails/blob/master/railties/lib/rails/tasks/misc.rake)

If you ever need to generate a new secret key, run...

```
$ rake secret  # from your rails app
$ ruby -e "require 'securerandom'; puts SecureRandom.hex(64)"  # from anywhere
```

[`SecureRandom`](https://ruby-doc.org/stdlib-2.5.0/libdoc/securerandom/rdoc/SecureRandom.html)
also contains methods for generating UUIDs, random
[base64 strings](https://en.wikipedia.org/wiki/Base64), and random
binary strings.


If you need a URL-safe key, say for API key generation, Ruby has you covered.

```ruby
SecureRandom.urlsafe_base64
```
