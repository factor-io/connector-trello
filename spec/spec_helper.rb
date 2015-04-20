require "codeclimate-test-reporter"
require 'rspec'
require 'factor-connector-api/test'
require 'rest-client'

CodeClimate::TestReporter.start if ENV['CODECLIMATE_REPO_TOKEN']

Dir.glob('./lib/factor/connector/*.rb').each { |f| require f }

RSpec.configure do |c|
  c.include Factor::Connector::Test

  c.before do
    Trello.configure do |config|
      config.developer_public_key = ENV['TRELLO_API_KEY']
      config.member_token = ENV['TRELLO_AUTH_TOKEN']
    end
    @board = Trello::Board.create(name: 'Test Board')
    @list = Trello::List.create(board_id: @board.id, name: 'Test List')
    @list_two = Trello::List.create(board_id: @board.id, name: 'Test List Two')
    @card = Trello::Card.create(list_id: @list.id, name: 'Test Card')
  end

  c.after do
    RestClient.put("https://trello.com/1/boards/#{@board.id}/closed?key=#{ENV['TRELLO_API_KEY']}&token=#{ENV['TRELLO_AUTH_TOKEN']}",value:true)
    @list.close
    @list_two.close
    @card.close
  end
end
