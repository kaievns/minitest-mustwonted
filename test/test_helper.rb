require_relative "../lib/minitest-mustwonted"

require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/setup'

class Minitest::Spec
  def assert_fails_correctly
    # TODO make sure that the errors are raised with correct file/line references
    -> { yield }.must_raise Minitest::Assertion
  end
end
