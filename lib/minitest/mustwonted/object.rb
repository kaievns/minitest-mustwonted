#
# The object level `must` | `wont` hooks
#
class Object
  #
  # kicks in the `must` assertion on the object
  #
  #     smth.must smth
  #     smth.must == somth
  #     ....
  #
  def must(*args)
    MiniTest::MustWonted::Matcher.must(self, *args)
  end

  #
  # kicks in the `wont` assertion on the object
  #
  #     smth.wont smth
  #     smth.wont == somth
  #     ....
  #
  def wont(*args)
    MiniTest::MustWonted::Matcher.wont(self, *args)
  end
end
