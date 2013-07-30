#
# This matcher automatically calls the legacy `must_smth`, `refute_something`
# matchers if they are exists
#
class Minitest::MustWonted::Matcher::Legacy

  def initialize(name, args, test)
    @name = name
    @args = args
    @test = test
  end

  def match?(subject, wont)
    # trying the must_smth|wont_smth first, coz they expect the subject first
    if subject.respond_to?(name = "#{wont ? 'wont' : 'must'}_#{@name}")
      subject.__send__ name, *@args

    # falling back to aseert|refute methods in case
    elsif @test.respond_to?(name = "#{wont ? 'refute' : 'assert'}_#{@name}")
      @test.__send__ name, subject, *@args
    elsif wont
      raise "Couldn't find the '#{wont ? 'refute' : 'assert'}_#{@name}' matcher"
    end
  end

end
