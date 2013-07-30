require 'test_helper'


describe Minitest::Spec do
  subject { {} }

  it "must allow to use must" do
    assert respond_to?(:must)
  end

  it "must allow to use wont" do
    assert respond_to?(:wont)
  end

  it "should bypass the 'must' calls to the current subject" do
    subject.expects(:must).with('something')
    must 'something'
  end

  it "should bypass the 'wont' calls to the current subject" do
    subject.expects(:wont).with('something')
    wont 'something'
  end
end
