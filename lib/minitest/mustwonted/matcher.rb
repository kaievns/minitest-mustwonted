#
# The actual matcher engine
#
class MiniTest::MustWonted::Matcher
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

end
