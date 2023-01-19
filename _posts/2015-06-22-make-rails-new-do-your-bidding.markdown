---
layout: post
title: "Make 'rails new' Do Your Bidding"
date: 2015-06-22 18:00
tags: ruby rails
comments: true
---

## `.railsrc`

Command line arguments in this file are appended to the `rails new` command. To see what options are available, take a look at the output from `rails new --help`. Save this file in your home directory.

## `rails_template.rb`

This file lets us completely customize our rails app, right down to which gems to add and which commands to run. See the [RailsGuides](http://guides.rubyonrails.org/rails_application_templates.html) for details on all that you can do.

## An example

The following files set up my new Rails apps the way I like 'em: RSpec, Factory Girl, and Capybara for testing. Foundation for the front-end. Postgres on the back. [Copy](https://gist.github.com/radavis/979ce4a34e84580be243) and customize to suit your needs.

```
# ~/.railsrc

--database=postgresql
--skip-bundle
--skip-spring
--skip-test-unit
--skip-turbolinks
--template=/path/to/rails_template.rb
```

```
# ~/rails_template.rb

gem_group :development, :test do
  gem "capybara"
  gem "factory_girl_rails"
  gem "rspec-rails", "~> 3.0"
  gem "pry-rails"
  gem "shoulda-matchers"
end

gem_group :test do
  gem "launchy", require: false
  gem "valid_attribute"
end

gem_group :production, :staging do
  gem "rails_12factor"
end

scss = <<-SCSS
@import "*";
SCSS

run "echo '#{scss}' >> app/assets/stylesheets/application.scss"
run "rm app/assets/stylesheets/application.css"
run "rm README.rdoc"
run "echo '# #{@app_name.titleize}' >> README.md"

run("bundle install")

generate("rspec:install")
rake("db:create")

run "echo 'require \"capybara/rails\"' >> spec/rails_helper.rb"

git :init
git add: "."
git commit: "-a -m initial"
```
