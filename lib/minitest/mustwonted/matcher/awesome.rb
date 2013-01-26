#
# Provides the awesome, pure logick like matchers
#
#     smth.must == smth
#     smth.must =~ /re/
#     smth.must > smth
#     ...
#
class MiniTest::MustWonted::Matcher::Awesome
  include MiniTest::Assertions

  attr_reader :subject, :flipped

  def initialize(subject, flipped)
    @subject = subject
    @flipped = flipped
  end

  def ==(value)
    __call 'equal', false, @subject, value
  end

  def !=(value)
    __call 'equal', true, @subject, value
  end

  def =~(regexp)
    __call 'match', false, @subject, regexp
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
