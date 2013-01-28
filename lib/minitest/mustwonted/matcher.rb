#
# The actual matcher engine
#
class MiniTest::MustWonted::Matcher

  class << self
    def must(subject, matcher=nil, flipped=false)
      if matcher == nil
        MiniTest::MustWonted::Matcher::Awesome.new(subject, flipped)
      elsif matcher.respond_to?(:match?)
        matcher.match?(subject, flipped)
        subject # returning the reference to the subject in case of chained calls
      else
        raise "Your matcher supposed to have method called: 'match?'"
      end
    end

    def wont(subject, matcher=nil)
      must subject, matcher, true
    end

    def add(name, klass)
      MiniTest::Unit::TestCase.instance_eval do
        define_method name do |*args|
          klass.new *args
        end
      end
    end
  end

end
