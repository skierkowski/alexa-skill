# encoding: UTF-8
$LOAD_PATH.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  s.name          = 'alexa-skill'
  s.version       = '0.1.04'
  s.platform      = Gem::Platform::RUBY
  s.authors       = ['Maciej Skierkowski']
  s.email         = ['maciej@factor.io']
  s.homepage      = 'https://factor.io'
  s.summary       = 'A DSL to easily create new custom Alexa Skills'
  s.description   = 'Create new cusotm Alexa skills with this library and server'
  s.files         = Dir.glob('lib/**/*.rb')
  s.license       = "MIT"

  s.test_files    = Dir.glob("./{test,spec,features}/*.rb")
  s.require_paths = ['lib']

  s.add_runtime_dependency 'sinatra', '~> 1.4.7'
  s.add_runtime_dependency 'alexa_skills_ruby', '~> 0.0.5'
  s.add_runtime_dependency 'nest_thermostat', '~> 0.0.4'
  s.add_runtime_dependency 'rake', '~> 11.2.2'
end