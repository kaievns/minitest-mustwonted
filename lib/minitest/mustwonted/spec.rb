#
# Extra sweets for the Minitest::Spec unit
#
class Minitest::Spec

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
      Minitest::MustWonted::Matcher::Magick.new(name, args)
    elsif respond_to?("assert_#{name}")
      Minitest::MustWonted::Matcher::Legacy.new(name, args, self)
    else
      super name, *args
    end
  end

end

if defined?(ActiveSupport)
  class ActiveSupport::TestCase
    #
    # Catching up the magick `be_smthing?` matchers
    #
    def method_missing(name, *args)
      if name.slice(0, 3) == 'be_'
        Minitest::MustWonted::Matcher::Magick.new(name, args)
      elsif respond_to?("assert_#{name}")
        Minitest::MustWonted::Matcher::Legacy.new(name, args, self)
      else
        super name, *args
      end
    end
  end
end
