require 'minitest/spec'

module MiniTest::MustWonted
  VERSION = '0.0.0'

  def self.add(*args)
    MiniTest::MustWonted::Matcher.add *args
  end
end

%w{
  matcher
  matcher/awesome
  matcher/magick
  matcher/legacy
  matcher/valid
  matcher/have
  object
  spec
  run
}.each do |file|
  require File.dirname(__FILE__) + "/mustwonted/#{file}"
end

# registering the matchers
MiniTest::MustWonted.add :have, MiniTest::MustWonted::Matcher::Have
MiniTest::MustWonted.add :have_valid, MiniTest::MustWonted::Matcher::Valid
