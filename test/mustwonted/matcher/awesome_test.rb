require 'test_helper'

describe MiniTest::MustWonted::Matcher::Awesome do

  describe "==" do
    it "must test correctly" do
      "22".must == "22"
      "22".wont == "33"
    end

    it "must fail correctly" do
      assert_fails_correctly{ "22".must == "33" }
      assert_fails_correctly{ "22".wont == "22" }
    end
  end

  describe "!=" do
    it "must test correctly" do
      "22".must != "33"
      "22".wont != "22"
    end

    it "must fail correctly" do
      assert_fails_correctly{ "22".must != "22" }
      assert_fails_correctly{ "22".wont != "33" }
    end
  end

  describe "=~" do
    it "must test correctly" do
      "22".must =~ /2/
      "22".wont =~ /3/
    end

    it "must fail correctly" do
      assert_fails_correctly{ "22".must =~ /3/ }
      assert_fails_correctly{ "22".wont =~ /2/ }
    end
  end

  describe ">" do
    it "must test correctly" do
      22.must > 11
      22.wont > 33
    end

    it "must fail correctly" do
      assert_fails_correctly{ 22.must > 33 }
      assert_fails_correctly{ 22.must > 22 }
      assert_fails_correctly{ 22.wont > 11 }
      assert_fails_correctly{ 22.wont > 21 }
    end
  end

  describe "<" do
    it "must test correctly" do
      22.must < 33
      22.wont < 11
    end

    it "must fail correctly" do
      assert_fails_correctly{ 22.must < 11 }
      assert_fails_correctly{ 22.must < 22 }
      assert_fails_correctly{ 22.wont < 33 }
      assert_fails_correctly{ 22.wont < 23 }
    end
  end

  describe ">=" do
    it "must test correctly" do
      22.must >= 11
      22.must >= 22
      22.wont >= 33
      22.wont >= 23
    end

    it "must fail correctly" do
      assert_fails_correctly{ 22.must >= 33 }
      assert_fails_correctly{ 22.must >= 23 }
      assert_fails_correctly{ 22.wont >= 22 }
      assert_fails_correctly{ 22.wont >= 11 }
    end
  end

  describe "<=" do
    it "must test correctly" do
      22.must <= 33
      22.must <= 23
      22.wont <= 21
      22.wont <= 11
    end

    it "must fail correctly" do
      assert_fails_correctly{ 22.must <= 11 }
      assert_fails_correctly{ 22.must <= 21 }
      assert_fails_correctly{ 22.wont <= 22 }
      assert_fails_correctly{ 22.wont <= 33 }
    end
  end
end
