# ActiveSupport::Concern

Instead of defining an `included` method to handle extending a class, we can
`extend ActiveSupport::Concern`.

> It is actually a pretty simple but powerful concept. It has to do with code
> reuse as in the example below. Basically, the idea is to extract common and/or
> context specific chunks of code in order to clean up the models and avoid them
> getting too fat and messy.

[source](https://stackoverflow.com/questions/14541823/how-to-use-concerns-in-rails-4#15078070)

## Resources

* [Put chubby models on a diet with concerns
](https://signalvnoise.com/posts/3372-put-chubby-models-on-a-diet-with-concerns)
* [ActiveSupport::Concern](http://api.rubyonrails.org/classes/ActiveSupport/Concern.html) - Warning: Foo/Bar examples (ugh).
