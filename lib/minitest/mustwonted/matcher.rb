#
# The actual matcher engine
#
class MiniTest::MustWonted::Matcher
  include MiniTest::Assertions

  attr_accessor :subject, :type

  def self.must(subject, args=[])
    new(subject, :must)
  end

  def self.wont(subject, args=[])
    new(subject, :wont)
  end

  def initialize(subject, type)
    @subject = subject
    @type    = type
  end

  def ==(value)
    __call 'equal', false, subject, value
  end

  def !=(value)
    __call 'equal', true, subject, value
  end

  def =~(regexp)
    __call 'match', false, subject, regexp
  end

  def > (value)
    __call 'operator', false, subject, :>, value
  end

  def < (value)
    __call 'operator', false, subject, :<, value
  end

  def >= (value)
    __call 'operator', false, subject, :>=, value
  end

  def <= (value)
    __call 'operator', false, subject, :<=, value
  end

private

  def __call(name, flip, *args)
    __send__ "#{
      type == (flip ? :wont : :must) ? 'assert' : 'refute'
    }_#{name}", *args
  end

end
