require 'minitest/spec'

module Minitest::MustWonted
  VERSION = '1.0.1'

  def self.add(*args)
    Minitest::MustWonted::Matcher.add *args
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
Minitest::MustWonted.add :have, Minitest::MustWonted::Matcher::Have
Minitest::MustWonted.add :have_valid, Minitest::MustWonted::Matcher::Valid
