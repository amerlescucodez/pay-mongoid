$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'pay/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'pay-mongoid'
  s.version     = Pay::VERSION
  s.authors     = ['Jason Charnes', 'Chris Oliver', 'Merlescu Codez']
  s.email       = ['jason@thecharnes.com', 'excid3@gmail.com', 'andrei+github@merlescu.net']
  s.homepage    = 'https://github.com/amerlescucodez/pay-mongoid'
  s.summary     = 'A Ruby on Rails subscription engine.'
  s.description = 'A Ruby on Rails subscription engine.'
  s.license     = 'MIT'

  s.files = Dir[
    '{app,config,db,lib}/**/*',
    'MIT-LICENSE',
    'Rakefile',
    'README.md'
  ]

  s.add_dependency 'rails', '>= 4.2'
  s.add_dependency 'rails-html-sanitizer', '~> 1.0.4'

  s.add_development_dependency 'braintree', '< 3.0', '>= 2.92.0'
  s.add_development_dependency 'stripe', '< 5.0', '>= 2.8'
  s.add_development_dependency 'stripe_event', '~> 2.2'

  s.add_development_dependency 'bundler', '< 2'
  s.add_development_dependency 'byebug'
  s.add_development_dependency 'mocha'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'mongoid'
  s.add_development_dependency 'stripe-ruby-mock', '~> 2.5'
  s.add_development_dependency 'vcr'
  s.add_development_dependency 'webmock'
end
