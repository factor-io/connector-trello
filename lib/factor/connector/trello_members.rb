require 'factor-connector-api'
require 'trello'

Factor::Connector.service 'trello_members' do
  action 'find_member' do |params|

    member_id = params['member_id'] # username or ID
    board_id = params['board_id'] # link ID or ID
    card_id = params['card_id']
    api_key = params['api_key']
    auth_token = params['auth_token']

    fail 'A member ID, card ID or board ID is required' unless member_id || card_id || board_id

    info 'Initializing connection to Trello'
    begin
      Trello.configure do |config|
        config.developer_public_key = api_key
        config.member_token = auth_token
      end
    rescue
      fail 'Authentication invalid'
    end

    info 'Finding member'
    begin
      members = if member_id
        Trello::Member.find(member_id)
      elsif board_id
        board = Trello::Board.find(board_id)
        board.members
      elsif card_id
        card = Trello::Card.find(card_id)
        card.members
      end
    rescue
      fail 'Failed to find member'
    end

    action_callback members
  end
  action 'add_member' do |params|

    member_id = params['member_id'] # username or ID
    card_id = params['card_id']
    api_key = params['api_key']
    auth_token = params['auth_token']

    fail 'A member ID is required' unless member_id
    fail 'A card ID is required' unless card_id

    info 'Initializing connection to Trello'
    begin
      Trello.configure do |config|
        config.developer_public_key = api_key
        config.member_token = auth_token
      end
    rescue
      fail 'Authentication invalid'
    end

    info 'Adding member to card'
    begin
      card = Trello::Card.find(card_id)
      board = card.board
      member = Trello::Member.find(member_id)
      update = if board.members.include? member
        card.add_member(member)
      else
        board.add_member(member)
        card.add_member(member)
      end
    rescue
      fail 'Failed to add member'
    end

    action_callback update
  end
end
