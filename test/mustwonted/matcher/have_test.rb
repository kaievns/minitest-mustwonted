require 'test_helper'

describe MiniTest::MustWonted::Matcher::Have do

  describe 'simple case' do
    subject{ Struct.new(:dogs, :cats).new(3,2) }

    it "must check correctly" do
      subject.must have(3).dogs
      subject.must have(2).cats

      subject.wont have(2).dogs
      subject.wont have(3).cats
    end

    it "must fail correctly" do
      assert_fails_correctly{ subject.must have(3).cats }
      assert_fails_correctly{ subject.wont have(2).cats }
    end
  end

  describe 'case with extra arguments' do
    class Subject
      DOGS = {large: 4, small: 2}

      def dogs(size=nil)
        if size
          DOGS[size]
        else
          DOGS[:large] + DOGS[:small]
        end
      end
    end

    subject { Subject.new }

    it "must handle everything correctly" do
      subject.must have(4).dogs(:large)
      subject.must have(2).dogs(:small)
      subject.must have(6).dogs

      subject.wont have(2).dogs(:large)
      subject.wont have(3).dogs(:small)
      subject.wont have(4).dogs
    end

    it "must fail correctly" do
      assert_fails_correctly{ subject.must have(3).dogs(:large) }
      assert_fails_correctly{ subject.wont have(4).dogs(:large) }
    end
  end

  describe "fallback with the 'items'" do
    it "must handle 'items' call as the size one" do
      [1,2,3].must have(3).items
      [1    ].must have(1).item

      [1,2,3].wont have(5).items
      [1,2  ].wont have(1).item
    end

    it "must fail correctly" do
      assert_fails_correctly{ [1,2].must have(5).items }
      assert_fails_correctly{ [1,2].wont have(2).items }
    end
  end

end
