# encoding: UTF-8
$LOAD_PATH.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  s.name          = 'factor-connector-trello'
  s.version       = '0.0.5'
  s.platform      = Gem::Platform::RUBY
  s.authors       = ['Josie Wright']
  s.email         = ['jozwright@gmail.com']
  s.homepage      = 'https://factor.io'
  s.summary       = 'Trello Factor.io Connector'
  s.files         = Dir.glob('lib/factor/connector/*.rb')

  s.require_paths = ['lib']

  s.add_runtime_dependency 'factor-connector-api', '~> 0.0.14'
  s.add_runtime_dependency 'ruby-trello', '~> 1.1.3'
  s.add_runtime_dependency 'rest-client', '~> 1.7.3'

  s.add_development_dependency 'codeclimate-test-reporter', '~> 0.4.7'
  s.add_development_dependency 'rspec', '~> 3.2.0'
  s.add_development_dependency 'rake', '~> 10.4.2'
end
