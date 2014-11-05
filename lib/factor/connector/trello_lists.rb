require 'factor-connector-api'
require 'trello'
require 'rest-client'

Factor::Connector.service 'trello_lists' do
  action 'create' do |params|

    board_id   = params['board_id']
    name       = params['name']
    api_key    = params['api_key']
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

  action 'find' do |params|

    list_id    = params['list_id']
    api_key    = params['api_key']
    auth_token = params['auth_token']

    fail 'List identification is required' unless list_id

    info 'Initializing connection to Trello'
    begin
      Trello.configure do |config|
        config.developer_public_key = api_key
        config.member_token = auth_token
      end
    rescue
      fail 'Authentication invalid'
    end

    info 'Retrieving list information'
    begin
      list = Trello::List.find(list_id)
    rescue
      fail 'Failed to find specified list'
    end

    action_callback list
  end
  action 'close' do |params|

    list_id    = params['list_id']
    api_key    = params['api_key']
    auth_token = params['auth_token']

    fail 'List identification is required' unless list_id

    info 'Initializing connection to Trello'
    begin
      Trello.configure do |config|
        config.developer_public_key = api_key
        config.member_token = auth_token
      end
    rescue
      fail 'Authentication invalid'
    end

    info 'Closing list'
    begin
      list = Trello::List.find(list_id)
      response = RestClient.put("https://trello.com/1/lists/#{list.id}/closed?key=#{api_key}&token=#{auth_token}",value:true)
    rescue
      fail 'Failed to close list'
    end

    action_callback response
  end
end
