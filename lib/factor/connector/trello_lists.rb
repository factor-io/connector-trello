require 'factor-connector-api'
require 'trello'

Factor::Connector.service 'trello_lists' do
  action 'create_list' do |params|

    board_id = params['board_id']
    name = params['name']
    api_key = params['api_key']
    auth_token = params['auth_token']

    fail 'Board identification is required' unless board_id
    fail 'A list name is required' unless name

    content = {
      board_id: board_id,
      name: name
    }

    info 'Initializing connection to Trello'
    begin
      Trello.configure do |config|
        config.developer_public_key = api_key
        config.member_token = auth_token
      end
    rescue
      fail 'Authentication invalid'
    end

    info 'Creating new list'
    begin
      list = Trello::List.create(content)
    rescue
      'Failed to create list'
    end

    action_callback list
  end
end
