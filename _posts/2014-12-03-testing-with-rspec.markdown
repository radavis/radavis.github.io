---
layout: post
title: "Testing with RSpec"
date: 2014-12-03 12:00
tags: ruby rspec test-driven-development
categories: ruby
comments: true
---

## Resources
* [Getting Started with RSpec](https://relishapp.com/rspec/docs/gettingstarted)
* [RSpec Documentation](https://relishapp.com/rspec)
* [Better Specs](http://betterspecs.org/)

## Getting Started
Install rspec, rspec-core, rspec-expectations, rspec-mocks, rspec-support
```
$ gem install rspec
```

Get help
```
$ rspec --help
```

## Basics
* Describe the methods of the class you are testing
* Initialize a new object
* Call methods on the object
* The 'expect' clause tests what we expect to happen

```ruby
require "rspec"

RSpec.describe Car do
  describe "#new" do
    it "creates a new instance when passed make, model, and year" do
      car = Car.new("Tesla", "Model S", 2014)
      expect(car).to be_a(Car)
    end

    it "initializes the odometer to zero" do
      car = Car.new("Toyota", "Prius", 2010)
      expect(car.odometer).to eq(0)
    end
  end
end
```

## Test Driven Development
* Write a test case, and run it. It should fail. (Red)
* Write only enough code to make the test pass. (Green)
* Cleanup code, extract methods, eliminate duplication. (Refactor)
* Repeat

[TDD on Wikipedia](http://en.wikipedia.org/wiki/Test-driven_development#Test-driven_development_cycle)


## Pretty Output: Create a .rspec file
`echo "--color --format doc" > .rspec`


## Exercises
* Circle class
* Pig Latin
* Blackjack

### Circle
* initialize with a radius and optional position
* instance methods:
  - radius: `r`
  - diameter: `d = 2r`
  - area: `a = πr^2`
  - point within circle: `(x1 - x)^2 + (y1 - y)^2 <= r^2`
* class methods:
  - total area

### Pig Latin
* initialize with a string
* instance methods:
  - translate
* rules:
  - starts with consonant, move to end, append 'ay'
  - starts with vowel, append 'way'

### Blackjack
* classes:
  - Card
  - Deck
  - Hand

```ruby
# circle_spec.rb
require "rspec"
require_relative "circle"

DELTA = 0.01

RSpec.describe Circle do
  describe "#initialize" do
    it "takes a value for the radius" do
      circle = Circle.new(5)
      expect(circle).to be_a(Circle)
    end

    it "takes an optional values for the center point" do
      circle = Circle.new(5, 1, 2)
      expect(circle).to be_a(Circle)
      expect(circle.x).to eq(1)
      expect(circle.y).to eq(2)
    end
  end

  describe "#radius" do
    it "returns the value for radius" do
      circle = Circle.new(5)
      expect(circle.radius).to eq(5)
    end
  end

  describe "#diameter" do
    it "returns 10 when the radius is 5" do
      circle = Circle.new(5)
      expect(circle.diameter).to eq(10)
    end

    it "returns 20 when the radius is 10" do
      circle = Circle.new(10)
      expect(circle.diameter).to eq(20)
    end

    it "returns 0.5 when the radius is 0.25" do
      circle = Circle.new(0.25)
      expect(circle.diameter).to eq(0.5)
    end
  end

  describe "#area" do
    it "returns 314.16 when radius is 10" do
      circle = Circle.new(10)
      expect(circle.area).to be_within(DELTA).of(314.16)
    end

    it "returns 12.57 when radius is 2" do
      circle = Circle.new(2)
      expect(circle.area).to be_within(DELTA).of(12.57)
    end

    it "returns 0.785 when radius is 0.5" do
      circle = Circle.new(0.5)
      expect(circle.area).to be_within(DELTA).of(0.785)
    end
  end

  describe "#contains_point?" do
    it "returns true for a point within the circle" do
      circle = Circle.new(1)
      expect(circle.contains_point?(0.25, 0.25)).to be true
    end

    it "returns true for a point on the edge of a circle" do
      circle = Circle.new(1)
      expect(circle.contains_point?(0, 1)).to be true
    end

    it "returns false for a point outside of the circle" do
      circle = Circle.new(1)
      expect(circle.contains_point?(4, 3)).to be false
    end
  end
end
```

```ruby
# game_spec.rb
# install rspec, rspec-core, rspec-expectations, rspec-mocks, rspec-support
# $ gem install rspec

# get help
# $ rspec --help

# game spec
require "rspec"
require_relative "game"

RSpec.describe Game do
  describe "#score" do
    it "returns 0 for an all gutter game" do
      game = Game.new
      20.times { game.roll(0) }
      expect(game.score).to eq(0)
    end
  end
end
```
