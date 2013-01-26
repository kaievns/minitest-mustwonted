require 'test_helper'

describe Object do

  subject { nil }

  describe "#must" do
    it "must be present on any object" do
      assert subject.respond_to?(:must)
    end

    it "must bypass the call into Matcher.must" do
      MiniTest::MustWonted::Matcher.expects(:must).with(subject, 'something')

      subject.must 'something'
    end
  end

  describe "#wont" do
    it "must be present on any object" do
      assert subject.respond_to?(:wont)
    end

    it "must bypass the call into Matcher.wont" do
      MiniTest::MustWonted::Matcher.expects(:wont).with(subject, 'something')

      subject.wont 'something'
    end
  end

end
