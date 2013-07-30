#
# Provides the awesome, pure logick like matchers
#
#     smth.must == smth
#     smth.must =~ /re/
#     smth.must > smth
#     ...
#
class Minitest::MustWonted::Matcher::Awesome
  include Minitest::Assertions

  attr_accessor :subject, :flipped, :assertions

  def initialize(subject, flipped)
    @subject    = subject
    @flipped    = flipped
    @assertions = 0
  end

  def ==(value)
    __call 'equal', false, value, @subject
  end

  def !=(value)
    __call 'equal', true, value, @subject
  end

  def =~(regexp)
    __call 'match', false, regexp, @subject
  end

  def > (value)
    __call 'operator', false, @subject, :>, value
  end

  def < (value)
    __call 'operator', false, @subject, :<, value
  end

  def >= (value)
    __call 'operator', false, @subject, :>=, value
  end

  def <= (value)
    __call 'operator', false, @subject, :<=, value
  end

private

  def __call(name, flip, *args)
    __send__ "#{@flipped == flip ? 'assert' : 'refute'}_#{name}", *args
  end

end
