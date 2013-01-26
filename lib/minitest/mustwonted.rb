require 'minitest/spec'

module MiniTest::MustWonted
  VERSION = '0.0.0'
end

%w{
  matcher
  object
  spec
  run
}.each do |file|
  require File.dirname(__FILE__) + "/mustwonted/#{file}"
end
