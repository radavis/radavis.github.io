---
layout: post
title: "How to Run Javascript in your Rails Test Suite"
date: 2015-04-08 12:00
tags: ruby rails javascript rspec capybara
---

**Update 2016-04-02**: Lately, I have preferred using [capybara-webkit](https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit) as a solution to this problem.

install phantomjs

```
brew install phantomjs
```

Gemfile:

```
group :test do
  gem 'poltergeist'
  gem 'database_cleaner'
end
```

spec/support/database_cleaner.rb

```
RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end
```

spec/rails_helper.rb

```
require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.use_transactional_fixtures = false
end
```

Then, add `js: true` to the test scenarios where you have javascript to test:

```
scenario 'upvote', js: true do
```

see what is happening:

```
save_screenshot("capybara-js.png")
```
