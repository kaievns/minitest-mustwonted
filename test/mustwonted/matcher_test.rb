require 'test_helper'

describe MiniTest::MustWonted::Matcher do
  subject{ nil }

  Matcher = MiniTest::MustWonted::Matcher

  describe ".must" do
    describe "without a matcher" do
      let(:matcher) { Matcher.must(subject) }

      it "must create an Awesome matcher" do
        assert_instance_of Matcher::Awesome, matcher
      end

      it "must assign the current subject to the matcher" do
        matcher.subject.must_equal subject
      end

      it "must set the matcher as a straight one" do
        matcher.flipped.must_equal false
      end
    end
  end

  describe ".wont" do
    describe "without a matcher" do
      let(:matcher) { Matcher.wont(subject) }

      it "must create an Awesome matcher" do
        assert_instance_of Matcher::Awesome, matcher
      end

      it "must assign the current subject to the matcher" do
        matcher.subject.must_equal subject
      end

      it "must set the matcher as a flipped one" do
        matcher.flipped.must_equal true
      end
    end
  end

end
