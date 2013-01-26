require 'test_helper'

describe MiniTest::MustWonted::Matcher do
  subject{ nil }

  Matcher = MiniTest::MustWonted::Matcher

  describe ".must" do
    before do
      @matcher = Matcher.must(subject, [:smth])
    end

    it "should create an instance of the matcher" do
      assert @matcher.is_a?(Matcher)
    end

    it "should set the subject as the matcher's subject" do
      assert_equal @matcher.subject, subject
    end

    it "should set the type of the matcher as :must" do
      assert_equal @matcher.type, :must
    end
  end

  describe ".wont" do
    before do
      @matcher = Matcher.wont(subject, [:smth])
    end

    it "should create an instance of the matcher" do
      assert @matcher.is_a?(Matcher)
    end

    it "should set the subject as the matcher's subject" do
      assert_equal @matcher.subject, subject
    end

    it "should set the type of the matcher as :wont" do
      assert_equal @matcher.type, :wont
    end
  end

  describe "awesome matchers" do

    describe "==" do
      it "must be handled correctly" do
        "22".must == "22"
        "22".wont == "33"
      end

      it "must fail correctly" do
        -> { "22".must == "33" }.must_raise MiniTest::Assertion
        -> { "22".wont == "22" }.must_raise MiniTest::Assertion
      end
    end

    describe "!=" do
      it "must be handled correctly" do
        "22".must != "33"
        "22".wont != "22"
      end

      it "must fail correctly" do
        -> { "22".must != "22" }.must_raise MiniTest::Assertion
        -> { "22".wont != "33" }.must_raise MiniTest::Assertion
      end
    end
  end

end
