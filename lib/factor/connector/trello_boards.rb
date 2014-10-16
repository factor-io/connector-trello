require 'factor-connector-api'
require 'trello'
require 'rest-client'

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
  action 'find_board' do |params|

    board_id = params['board_id']
    api_key = params['api_key']
    auth_token = params['auth_token']

    fail 'A board board ID is required' unless board_id

    info 'Initializing connection to Trello'
    begin
      Trello.configure do |config|
        config.developer_public_key = api_key
        config.member_token = auth_token
      end
    rescue
      fail 'Authentication invalid'
    end

    info 'Finding board'
    begin
      board = Trello::Board.find(board_id)
    rescue
      'Failed to find board'
    end

    action_callback board
  end

  action 'close_board' do |params|

    board_id = params['board_id']
    api_key = params['api_key']
    auth_token = params['auth_token']

    fail 'Board identification is required' unless board_id

    info 'Initializing connection to Trello'
    begin
      Trello.configure do |config|
        config.developer_public_key = api_key
        config.member_token = auth_token
      end
    rescue
      fail 'Authentication invalid'
    end

    info 'Closing board'
    begin
      board = Trello::Board.find(board_id)
      response = RestClient.put("https://trello.com/1/boards/#{board.id}/closed?key=#{api_key}&token=#{auth_token}",value:true)
    rescue
      fail 'Failed to close board'
    end

    action_callback response
  end
end
