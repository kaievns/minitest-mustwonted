require 'test_helper'

describe MiniTest::MustWonted::Matcher::Valid do

  class User
    attr_accessor :name, :email, :errors

    def initialize(params)
      @name  = params[:name]
      @email = params[:email]
    end

    def valid?
      @errors = {}

      @errors[:name]  = ["Can't be blank"] if !@name
      @errors[:email] = ["Can't be blank"] if !@email

      @errors.size == 0
    end
  end

  describe "without options" do
    it "must validate objects correctly" do
      user = User.new(name: 'Nikolay', email: 'nikolay@theosom.com')

      user.must have_valid(:name)
      user.must have_valid(:email)
    end

    it "must invalidate objects correctly" do
      user = User.new({})

      user.wont have_valid(:name)
      user.wont have_valid(:email)
    end

    it "must fail correctly" do
      user = User.new(name: 'Nikolay')

      assert_fails_correctly{ user.must have_valid(:email) }
      assert_fails_correctly{ user.wont have_valid(:name)  }
    end
  end

  describe "with a list of options" do
    let(:user) { User.new({}) }

    it "must validate objects correctly" do
      user.must have_valid(:name).with('Nikolay', 'Vasilisa')
      user.must have_valid(:email).with('nikolay@theosom.com', 'vasilisa@theosom.com')
    end

    it "must invalidate objects correctly" do
      user.wont have_valid(:name).with(nil,  false)
      user.wont have_valid(:email).with(nil, false)
    end

    it "must fail correctly with wrong data" do
      assert_fails_correctly{ user.must have_valid(:name).with(nil) }
      assert_fails_correctly{ user.wont have_valid(:name).with("Nikolay") }
    end
  end

end
