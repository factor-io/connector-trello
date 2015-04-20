require 'factor-connector-api'
require 'trello'

Factor::Connector.service 'trello_cards' do
  action 'create' do |params|

    list_id    = params['list_id']
    name       = params['name']
    api_key    = params['api_key']
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

  action 'find' do |params|

    card_id    = params['card_id']
    list_id    = params['list_id']
    board_id   = params['board_id']
    member_id  = params['member_id']
    api_key    = params['api_key']
    auth_token = params['auth_token']

    fail 'Card, list, board or member identification is required' unless card_id || list_id || board_id || member_id

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
      cards = if card_id
        Trello::Card.find(card_id)
      elsif list_id
        list = Trello::List.find(list_id)
        list.cards
      elsif board_id
        board = Trello::Board.find(board_id)
        board.cards
      elsif member_id
        member = Trello::Member.find(member_id)
        member.cards
      end
    rescue
      fail 'Failed to find specified card'
    end

    action_callback cards
  end

  action 'move' do |params|

    card_id     = params['card_id']
    list_two_id = params['list_two_id']
    api_key     = params['api_key']
    auth_token  = params['auth_token']

    fail 'Card identification is required' unless card_id
    fail 'List identification is required' unless list_two_id

    info 'Initializing connection to Trello'
    begin
      Trello.configure do |config|
        config.developer_public_key = api_key
        config.member_token = auth_token
      end
    rescue
      fail 'Authentication invalid'
    end

    info 'Moving card'
    begin
      card = Trello::Card.find(card_id)
      moved_card = card.move_to_list(list_two_id)
    rescue
      fail 'Failed to move card'
    end

    action_callback moved_card
  end

  action 'delete' do |params|

    card_id    = params['card_id']
    api_key    = params['api_key']
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

    info 'Deleting card'
    begin
      card = Trello::Card.find(card_id)
      response = card.delete
    rescue
      fail 'Failed to delete card'
    end

    action_callback response
  end
end
