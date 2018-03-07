---
layout: post
title: "Redirect Emails in Staging Environments"
date: 2018-03-05 21:00
tags: rails, email
comments: true
---

In a staging environment, or any environment other than production, it is
imperative that emails are never sent to end users.

Rails has a built-in feature that allows you to [intercept emails][1]. Couple
this with an [environment variable][2] containing a list of comma-separated
emails, and you have an simple way for your team to verify that your staging
server is in fact triggering email deliveries, as well as ensuring that none of
your customers are receiving email spam outside of production.

Set the following variables in your staging server's environment.

```bash
HOSTNAME="yourapp.com"
REDIRECT_ALL_OUTGOING_EMAIL_TO="rahul@eg.com, rich@eg.com, riki@eg.com, jackie@eg.com"
```

Configure your Rails application to use the appropriate hostname when creating
links within emails, as well as to redirect emails to a CSV list of addresses,
when defined.

```ruby
# config/initializers/action_mailer.rb
module YourApp
  class Application < Rails::Application
    # use the appropriate url based on the environment
    config.action_mailer.default_url_options = { host: ENV["HOSTNAME"] }

    # store emails in the ActionMailer::Base.deliveries array when testing
    if Rails.env.test?
      config.action_mailer.delivery_method = :test
    end

    # set REDIRECT_ALL_OUTGOING_EMAIL_TO to one or more comma separated emails
    if !Rails.env.test? && ENV["REDIRECT_ALL_OUTGOING_EMAIL_TO"].present?
      ActionMailer::Base.register_interceptor(RedirectAllOutgoingEmail)
    end
  end
end
```

Here's where the actual overriding of emails occurs. In this case, we're
redirecting all outgoing deliveries to our CSV list of emails, and updating the
email subject to include any relevant information.

```ruby
# lib/redirect_all_outgoing_email.rb
class RedirectAllOutgoingEmail
  def self.delivering_email(message)
    original_message_to = message.to
    message.to = ENV["REDIRECT_ALL_OUTGOING_EMAIL_TO"]

    original_message_subject = message.subject
    message.subject = "HOST: #{ENV['HOSTNAME']} "
    message.subject += "TO: #{original_message_to} "
    message.subject += "SUBJECT: #{original_message_subject}"
  end
end
```

You may need to add this line to your `config/application.rb` file to load the
`RedirectAllOutgoingEmail` class.

```ruby
# https://stackoverflow.com/a/40206732
config.autoload_paths << "#{Rails.root}/lib"
```

Now, you can rest assured that emails are only being delivered to end-users in
the production environment.

[1]: http://guides.rubyonrails.org/action_mailer_basics.html#intercepting-emails
[2]: https://12factor.net/config
