#
# The unversal `have` matcher
#
#     @user.must have(10).comments
#     @array.must have(2).items
#
class Minitest::MustWonted::Matcher::Have

  def initialize(size)
    @size = size
  end

  def match?(subject, wont)
    if [:items, :item].include?(@name) && !subject.respond_to?(@name)
      items = subject
    else
      items = subject.send @name, *@args
    end

    if wont ? items.size == @size : items.size != @size
      raise Minitest::Assertion, "Expected #{subject.inspect} to have #{
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
