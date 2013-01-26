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

  #
  # Catching up the magick `be_smthing?` matchers
  #
  def method_missing(name, *args)
    if name.slice(0, 3) == 'be_'
      MiniTest::MustWonted::Matcher::Magick.new(name, args)
    else
      super name, *args
    end
  end

end
