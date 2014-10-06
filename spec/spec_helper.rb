require "codeclimate-test-reporter"
require 'rspec'
require 'wrong'

CodeClimate::TestReporter.start

Dir.glob('./lib/factor/connector/*.rb').each { |f| require f }

module ServiceContext
  def service_instance(service_name)
    Factor::Connector.get_service_manager(service_name).instance
  end
end

RSpec.configure do |c|
  c.include Wrong
  c.include ServiceContext
end