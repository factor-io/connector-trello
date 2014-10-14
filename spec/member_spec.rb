require 'spec_helper'

describe 'trello_lists' do
  before do
    Trello.configure do |config|
      config.developer_public_key = ENV['TRELLO_API_KEY']
      config.member_token = ENV['TRELLO_AUTH_TOKEN']
    end
    @board = Trello::Board.create(name: 'Test Board')
    @list = Trello::List.create(board_id: @board.id, name: 'Test List')
    @card = Trello::Card.create(list_id: @list.id, name: 'Test Card')
  end

  after do
    @list.close
    @card.close
  end

  it 'can find a member' do

    api_key = ENV['TRELLO_API_KEY']
    auth_token = ENV['TRELLO_AUTH_TOKEN']
    member_id = ENV['TRELLO_MEMBER_ID']

    service_instance = service_instance('trello_members')

    params = {
      'member_id' => member_id,
      'auth_token' => auth_token,
      'api_key' => api_key
    }

    service_instance.test_action('find_member', params) do
      expect_info message: 'Initializing connection to Trello'
      expect_info message: 'Finding member'
      expect_return
    end
  end

  it 'can add a member' do

    api_key = ENV['TRELLO_API_KEY']
    auth_token = ENV['TRELLO_AUTH_TOKEN']
    member_id = ENV['TRELLO_MEMBER_ID']
    card_id = @card.id

    service_instance = service_instance('trello_members')

    params = {
      'member_id' => member_id,
      'card_id' => card_id,
      'auth_token' => auth_token,
      'api_key' => api_key
    }

    service_instance.test_action('add_member', params) do
      expect_info message: 'Initializing connection to Trello'
      expect_info message: 'Adding member to card'
      expect_return
    end
  end
end
