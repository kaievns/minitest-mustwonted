# Must Wanted Things for MiniTest

This is a little plugn for [minitest](https://github.com/seattlerb/minitest)
which contains a new `must/wont` matchers engine, a set of essential matchers
and hooks for testing rails applications.

## Usage

1) Add `gem minitest-mustwonted` into your `Gemfile`
2) Enjoy!


## Magick Matchers

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


## Credits

Most ideas were boldly taken from:

[minitest-rails](https://github.com/blowmage/minitest-rails)
[minitest-matchers](https://github.com/zenspider/minitest-matchers)
[shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers)
[rspec-rails](https://github.com/rspec/rspec-rails)


## Copyright

All code in this library is published under the terms of the MIT License

Copyright (C) 2013 Nikolay Nemshilov
