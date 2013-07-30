require 'test_helper'

describe Minitest::MustWonted::Matcher::Legacy do

  describe "simple case" do
    it "must be handled correctly" do
      '3'.must equal('3')
      [3].must equal([3])

      '2'.wont equal('3')
      [2].wont equal([3])
    end

    it "must fail correctly" do
      assert_fails_correctly{ '2'.must equal('3') }
      assert_fails_correctly{ '2'.wont equal('2') }
    end
  end

  describe "custom made assertions" do
    subject { 'subject' }

    def assert_do_custom_stuff(subj, value)
      assert_equal subj,  subject
      assert_equal value, 3
    end

    it "should catch up with them correctly" do
      subject.must do_custom_stuff(3)
    end

    it "must fail when called with 'wont' coz there's no refute" do
      assert_raises RuntimeError, "Couldn't find the 'refute_do_custom_stuff' matcher" do
        subject.wont do_custom_stuff(3)
      end
    end
  end

end
