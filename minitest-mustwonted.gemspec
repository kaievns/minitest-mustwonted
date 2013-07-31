Gem::Specification.new do |s|
  s.name    = 'minitest-mustwonted'
  s.version = '1.0.2'
  s.date    = '2013-08-01'

  s.summary = "new must/wont matchers engine for Minitest"
  s.description = "Provides a new unversal and esily extendable matchers engine"

  s.authors  = ['Nikolay Nemshilov']
  s.email    = 'nemshilov@gmail.com'
  s.homepage = 'http://github.com/MadRabbit/minitest-mustwonted'
  s.add_dependency('minitest')
  s.license  = 'MIT'

  s.files = Dir['lib/**/*'] + Dir['test/**/*']
  s.files+= %w(
    README.md
  )
end
