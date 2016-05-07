---
layout: post
title: "Sign in/Sign out test helpers for Devise and Capybara"
date: 2014-09-24 10:54
tags: rspec devise capybara
---

The [Devise documentation](https://github.com/plataformatec/devise/wiki/How-To:-Test-with-Capybara) does a rather good job of describing how to gain access `login_as` and `logout` helpers in your Capybara tests. Although, it could be better.

Create a new file in the `/spec/support` folder of your Rails app.

```
# /spec/support/warden.rb

RSpec.configure do |config|
  include Warden::Test::Helpers
  Warden.test_mode!

  config.after(:each) do
    Warden.test_reset!
  end
end
```

Uncomment or add in the following line to your `spec_helper.rb` or `rails_helper.rb` file to automatically require files located in the `/spec/support` folder.

```
# /spec/rails_helper.rb

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
```

Now, we can call the `login_as` and `logout` helper methods in our tests. However, I'm using the 'Sign in/Sign out' terminology in my application. Aliasing these methods helps keep my tests in line with my views.

```
# /spec/support/warden.rb

RSpec.configure do |config|
  include Warden::Test::Helpers
  Warden.test_mode!

  config.after(:each) do
    Warden.test_reset!
  end

  def sign_in(user, opts = {})
    login_as(user, opts)
  end

  def sign_out(*scopes)
    logout(*scopes)
  end
end
```

Now, in your feature specs, you can simply `sign_in(user)`.
