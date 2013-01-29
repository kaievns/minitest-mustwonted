Gem::Specification.new do |s|
  s.name    = 'minitest-mustwonted'
  s.version = '1.0.0'
  s.date    = '2013-01-29'

  s.summary = "new must/wont matchers engine for minitest"
  s.description = "Provides a new unversal and esily extendable matchers engine"

  s.authors  = ['Nikolay Nemshilov']
  s.email    = 'nemshilov@gmail.com'
  s.homepage = 'http://github.com/MadRabbit/minitest-mustwonted'
  s.add_dependency('minitest')

  s.files = Dir['lib/**/*'] + Dir['test/**/*']
  s.files+= %w(
    README.md
  )
end
