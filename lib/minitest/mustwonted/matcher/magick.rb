#
# The Magick `be_smth` matcher
#
class MiniTest::MustWonted::Matcher::Magick

  def initialize(name, args)
    @name = name.slice(3, name.size)
    @name+= '?' if name[name.size - 1] != '?'
    @args = args
  end

  def match?(subject, wont)
    @name = 'is_a?' if @name == 'a?' || @name == 'an?'
    match = subject.send @name, *@args

    if wont ? match : !match
      raise MiniTest::Assertion, "Expected #{subject.inspect} ##{
        @name} to return: #{ wont ? "false" : "true"
      }\nbut instead have: #{match.inspect}"
    end
  end

end
