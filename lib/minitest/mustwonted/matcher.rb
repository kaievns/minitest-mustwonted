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
    __send__ "#{type == :must ? 'assert' : 'refute'}_equal", subject, value
  end

  def !=(value)
    __send__ "#{type == :must ? 'refute' : 'assert'}_equal", subject, value
  end

end
