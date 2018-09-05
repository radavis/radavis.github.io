---
layout: post
title: "ActiveSupport::Concern"
date: 2018-09-05 10:30
tags: rails, concerns
---

Instead of defining an `included` method to handle extending a class, we can
`extend ActiveSupport::Concern`.

> It is actually a pretty simple but powerful concept. It has to do with code
> reuse as in the example below. Basically, the idea is to extract common and/or
> context specific chunks of code in order to clean up the models and avoid them
> getting too fat and messy.

[source](https://stackoverflow.com/questions/14541823/how-to-use-concerns-in-rails-4#15078070)

## Example

When we want to share code between classes in Ruby, we create a module.

```ruby
module UsefulCode
  def self.included(base)
    base.extend ClassMethods
    base.class_eval do
      scope :disabled, -> { where(disabled: true) }
    end
  end

  module ClassMethods
    ...
  end
end
```

`ActiveSupport::Concern` gives us a way to simplify the extraction of shared code.

```ruby
require 'active_support/concern'

module UsefulCode
  extend ActiveSupport::Concern

  included do
    scope :disabled, -> { where(disabled: true) }
  end

  class_methods do
    ...
  end
end
```

[source](http://api.rubyonrails.org/v5.1/classes/ActiveSupport/Concern.html)

## Resources

* [Put chubby models on a diet with concerns
](https://signalvnoise.com/posts/3372-put-chubby-models-on-a-diet-with-concerns)
* [SoftDelete](https://github.com/workbar-dev/soft_delete) - Ruby Gem that uses a concern to share code.
