#
# Generic validations matcher
#
#     user.must have_valid(:name)
#     user.must have_valid(:name).with('Nikolay', 'Vasilisa', ...)
#     user.wont have_valid(:name).with(nil, '', false)
#
# Credits: we're mimicking the minitest-matchers validation matchers here
#
class MiniTest::MustWonted::Matcher::Valid
  def initialize(name)
    @name = name.to_sym
    @args = []
  end

  def match?(subject, wont)
    if @args.size == 0
      test!(subject, wont)
    else
      @args.each do |value|
        subject.send "#{@name}=", value
        test!(subject, wont)
      end
    end
  end

  def with(*args)
    @args = args

    self
  end

  def test!(subject, wont)
    valid = subject.valid?
    error = subject.errors[@name]

    if error && !wont
      raise MiniTest::Assertion, "Expected the #{
        subject.inspect} to have valid #{@name
        } with #{subject.send(@name).inspect
        }\nbut had an error instead: #{error.inspect}"
    elsif wont && !error
      raise MiniTest::Assertion, "Expected the #{
        subject.inspect} to have invalid #{@name
        } with #{subject.send(@name).inspect
        }\nbut had no errors for this field instead"
    end
  end
end
