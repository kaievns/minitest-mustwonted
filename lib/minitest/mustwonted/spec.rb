#
# Extra sweets for the MiniTest::Spec unit
#
class MiniTest::Spec

  #
  # A shortcut to `must` directly on current subject
  #
  #     subject { Something.new }
  #
  #     it { must do_something }
  #
  def must(*args)
    subject.must(*args)
  end

  #
  # A shortcut to `wont` directly on current subject
  #
  #     subject { Something.new }
  #
  #     it { wont do_something }
  #
  def wont(*args)
    subject.wont(*args)
  end

end
