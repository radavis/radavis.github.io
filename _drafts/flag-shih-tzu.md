# FlagShihTzu Rails Gem

Store a collection of boolean attributes as an integer column bit field.

This is being used in the Wobbe project as a way to keep track of `non_billable_days` in the Resource model.

## Database Side

* create an integer column on the table
* no null values
* default to zero (all false)
* name the column `flags` in order to avoid having to specify the column name in the model

## Model Side

```ruby
class Resource < ActiveRecord::Base
  include FlagShihTzu
  has_flags 1 => :mon,
            2 => :tue,
            3 => :wed,
            4 => :thu,
            5 => :fri,
            6 => :sat,
            7 => :sun,
            column: 'non_billable_days'
end
```

`has_flags` takes a hash of arguments. Keys are a positive integer, values are the names of the boolean fields that will exist on the model. **Key names should not change once defined!**

See the docs for the following info:

* bit field calculations
* model instance methods added through `has_flags`
* callbacks
* validations
* scopes

## Random

`bundle exec rake reek > REEK` for marking and finding things todo in the library source code.

## Resources

* [Homepage](https://github.com/pboling/flag_shih_tzu)
* [Bit field](https://en.wikipedia.org/wiki/Bit_field)
* [Documentation](http://www.rubydoc.info/github/pboling/flag_shih_tzu/frames)
* [Why you should use flag_shih_tzu](http://www.railsbling.com/posts/why-use-flag_shih_tzu/)
