#
# The unversal `have` matcher
#
#     @user.must have(10).comments
#     @array.must have(2).items
#
class MiniTest::MustWonted::Matcher::Have

  def initialize(size)
    @size = size
  end

  def match?(subject, wont)
    @name = :size if [:items, :item].include?(@name) && !subject.respond_to?(@name)
    size  = subject.send @name, *@args

    if wont ? size == @size : size != @size
      raise MiniTest::Assertion, "Expected #{subject.inspect} to have #{
        @size} ##{@name}(#{@args.join(',')})\nbut instead it has: #{size}"
    end
  end

  def method_missing(name, *args)
    name = name.pluralize if name.respond_to?(:pluralize)

    @name = name.to_sym
    @args = args

    self # returning itself so the end result was always this matcher
  end

end
