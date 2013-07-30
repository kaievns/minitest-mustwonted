#
# The actual matcher engine
#
class Minitest::MustWonted::Matcher

  class << self
    def must(subject, matcher=nil, flipped=false)
      if matcher == nil
        Minitest::MustWonted::Matcher::Awesome.new(subject, flipped)
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
      Minitest::Spec.instance_eval do
        define_method name do |*args|
          klass.new *args
        end
      end

      if defined?(ActiveSupport)
        ActiveSupport::TestCase.instance_eval do
          define_method name do |*args|
            klass.new *args
          end
        end
      end
    end
  end

end
