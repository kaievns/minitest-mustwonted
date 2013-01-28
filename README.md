# Must Wanted Things for MiniTest

This is a little plugn for [minitest](https://github.com/seattlerb/minitest)
which contains a new `must/wont` matchers engine, a set of essential matchers
and hooks for testing ruby/rails applications.

## Usage

1) Add `gem minitest-mustwonted` into your `Gemfile`
2) Enjoy!


## Awesome Matchers

Awesome matchers are set of easy to read logic-like matchers

```ruby
describe MiniTest::MustWonted do
  it "must provide awesome matchers" do
    22.must == 22
    22.wont == 33
    22.must != 22

    22.must >  11
    22.must >= 22
    22.must <= 23

    "22".must =~ /2/
    "22".wont =~ /3/
  end
end
```

## Magick Matchers

Magick matchers are `rspec` like `be_smth` matchers

```ruby
describe MiniTest::MustWonted do
  it "must provide magick matchers" do
    [].must  be_empty
    [0].wont be_empty

    nil.must be_nil
    '0'.wont be_nil

    '0'.must be_a(String)
    [0].must be_an(Array)
  end
end
```

## Collection Assertions

Additional `have` matcher will let you write easily readable collection checks

```ruby
describe MiniTest::MustWonted do
  class User
    def comments(type=nil)
      if type
        Comment.where(type: type, user: self).count
      else
        Comment.where(user: self).count
      end
    end
  end

  it "must provide collection matchers" do
    @user.must have(3).comments
    @user.must have(1).comment(:deleted)

    [1,2,3].must have(3).items
    [1    ].must have(1).item
  end
end
```

__NOTE__: calls will be automatically pluralized and resolved when possible. You
also can use the `item` or `items` on plain array-like objects, in which case it
will be checking the `size` method by default


## Legacy Matchers

Most of the `assert_smth` | `refute_smth` methods are piped throught the `must` |
`wont` interface automatically and resolved on fly.

```ruby
describe MiniTest::MustWonted do
  it "must support legacy assertions" do
    '2'.must equal(3)
    '3'.wont equal(2)

    '2'.must respond_to(:downcase)
    [2].wont respond_to(:unknown_method)
  end
end
```

Note, this module will automatically use your custom `assert_something` methods
as long as they take the subject as the first argument.


## Validation Matchers

`MustWonted` comes with a default models validation matchers similar to the
`minitest-matchers` validation package

```ruby
describe MiniTest::MustWonted do
  it "must provide validation matchers" do
    @user.must have_valid(:name).with("Nikolay", "Vasilisa")
    @user.wont have_valid(:name).with(nil, '', false)
  end
end
```


## Custom Matchers

There are two ways to define your own custom matchers. Firstly, you can just
define the `assert_your_own_stuff` and, if needed `refute_your_own_stuff` methods
and they will be automatically available via the `must`|`wont` interface

```ruby
describe Something do
  def assert_do_my_thing(object, *args)
    # do something
  end

  it "must work right away" do
    something.must do_my_thing(arg)
  end

  # if you're gonna call 'wont' as well, then define `refutre_` too
  def refute_do_my_thing(object, *args)
    # do something
  end

  it "wont do my thing" do
    something.wont do_my_thing(arg)
  ned
end
```

If you wanna do something more serious, you can define your matcher as a class

```ruby
class MyAwesomeMatcher
  def initialize(*args)
    @args = args
  end

  def match?(subject, wont)
    @args   # - the args you send into the matcher
    subject # - the object on which you called `must`|`wont`
    wont    # - gets `true` when you called `wont` and `false` when you called `must`

    if some_awesome_check_failed
      railse "Oh my god, we all gonna die here!"
    end
  end
end
```

Once you done, register your matcher with `MiniTest::MustWonted` and start using it

```ruby
MiniTest::MustWonted :method_name, MyAwesomeMatcher

describe Something do
  it "must do something" do
    object.must method_name(arg, arg, arg...)
  end
end
```


## Credits

Most ideas were boldly taken from:

[minitest-rails](https://github.com/blowmage/minitest-rails)
[minitest-matchers](https://github.com/zenspider/minitest-matchers)
[shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers)
[rspec-rails](https://github.com/rspec/rspec-rails)


## Copyright

All code in this library is published under the terms of the MIT License

Copyright (C) 2013 Nikolay Nemshilov
