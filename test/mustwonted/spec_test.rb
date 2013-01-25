require 'test_helper'


describe MiniTest::Spec do
  subject { {} }

  it "must allow to use must" do
    assert respond_to?(:must)
  end

  it "must allow to use wont" do
    assert respond_to?(:wont)
  end

  it "must return the Matcher from 'must' when called without params" do
    assert must.is_a?(MiniTest::MustWonted::Matcher)
  end

  it "must return the Matcher from 'must' when called without params" do
    assert wont.is_a?(MiniTest::MustWonted::Matcher)
  end

  it "must bind the current subject to the matchers from 'must'" do
    assert_equal must.subject, subject
  end

  it "must bind the current subject to the matchers from 'wont'" do
    assert_equal wont.subject, subject
  end

  it "must return a 'must' type matchers from 'must'" do
    assert_equal must.type, :must
  end

  it "must return a 'wont' type matchers from 'wont'" do
    assert_equal wont.type, :wont
  end

end
