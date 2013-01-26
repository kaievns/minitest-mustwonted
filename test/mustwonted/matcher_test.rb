require 'test_helper'

describe MiniTest::MustWonted::Matcher do
  subject{ nil }

  describe ".must" do
    before do
      @matcher = MiniTest::MustWonted::Matcher.must(subject, [:smth])
    end

    it "should create an instance of the matcher" do
      assert @matcher.is_a?(MiniTest::MustWonted::Matcher)
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
      @matcher = MiniTest::MustWonted::Matcher.wont(subject, [:smth])
    end

    it "should create an instance of the matcher" do
      assert @matcher.is_a?(MiniTest::MustWonted::Matcher)
    end

    it "should set the subject as the matcher's subject" do
      assert_equal @matcher.subject, subject
    end

    it "should set the type of the matcher as :wont" do
      assert_equal @matcher.type, :wont
    end
  end

end
