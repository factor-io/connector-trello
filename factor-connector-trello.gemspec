# encoding: UTF-8
$LOAD_PATH.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  s.name          = 'factor-connector-trello'
  s.version       = '0.0.1'
  s.platform      = Gem::Platform::RUBY
  s.authors       = ['Josie Wright', 'Andrew Akers']
  s.email         = ['jozwright@gmail.com', 'andrewrdakers@gmail.com']
  s.homepage      = 'https://factor.io'
  s.summary       = 'Trello Factor.io Connector'
  s.files         = ['lib/factor/connector/trello.rb']
  
  s.require_paths = ['lib']

  s.add_runtime_dependency 'factor-connector-api', '~> 0.0.3'
end