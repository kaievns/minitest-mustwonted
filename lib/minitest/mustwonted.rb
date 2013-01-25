require 'minitest/spec'

module MiniTest::MustWonted

end

%w{
  matcher
  spec
  run
}.each do |file|
  require File.dirname(__FILE__) + "/mustwonted/#{file}"
end
