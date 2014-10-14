require 'factor-connector-api'
require 'trello'

Factor::Connector.service 'trello_boards' do
  action 'create_board' do |params|

    name = params['name']
    api_key = params['api_key']
    auth_token = params['auth_token']

    fail 'A board name is required' unless name

    info 'Initializing connection to Trello'
    begin
      Trello.configure do |config|
        config.developer_public_key = api_key
        config.member_token = auth_token
      end
    rescue
      fail 'Authentication invalid'
    end

    info 'Creating new board'
    begin
      board = Trello::Board.create(name)
    rescue
      'Failed to create board'
    end

    action_callback board
  end
end
