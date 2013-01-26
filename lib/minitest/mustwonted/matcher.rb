#
# The actual matcher engine
#
class MiniTest::MustWonted::Matcher
  attr_accessor :subject, :type

  def initialize(subject, type)
    @subject = subject
    @type    = type
  end

end
