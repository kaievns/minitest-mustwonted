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



## Credits

Most ideas were boldly taken from:

[minitest-rails](https://github.com/blowmage/minitest-rails)
[minitest-matchers](https://github.com/zenspider/minitest-matchers)
[shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers)
[rspec-rails](https://github.com/rspec/rspec-rails)


## Copyright

All code in this library is published under the terms of the MIT License

Copyright (C) 2013 Nikolay Nemshilov
