require "codeclimate-test-reporter"
require 'rspec'
require 'wrong'
require 'factor-connector-api/test'

CodeClimate::TestReporter.start if ENV['CODECLIMATE_REPO_TOKEN']

Dir.glob('./lib/factor/connector/*.rb').each { |f| require f }

RSpec.configure do |c|
  c.include Factor::Connector::Test
end
