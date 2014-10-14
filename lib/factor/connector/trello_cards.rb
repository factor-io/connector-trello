require 'factor-connector-api'
require 'trello'

Factor::Connector.service 'trello_cards' do
  action 'create_card' do |params|

    list_id = params['list_id']
    name = params['name']
    api_key = params['api_key']
    auth_token = params['auth_token']

    fail 'List identification is required' unless list_id
    fail 'A card name is required' unless name

    content = {
      list_id: list_id,
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

    info 'Creating new card'
    begin
      card = Trello::Card.create(content)
    rescue
      'Failed to create card'
    end

    action_callback card
  end
  action 'find_card' do |params|

    card_id = params['card_id']
    api_key = params['api_key']
    auth_token = params['auth_token']

    fail 'Card identification is required' unless card_id

    info 'Initializing connection to Trello'
    begin
      Trello.configure do |config|
        config.developer_public_key = api_key
        config.member_token = auth_token
      end
    rescue
      fail 'Authentication invalid'
    end

    info 'Finding card'
    begin
      card = Trello::Card.find(card_id)
    rescue
      fail 'Failed to find specified card'
    end

    action_callback card
  end
end
