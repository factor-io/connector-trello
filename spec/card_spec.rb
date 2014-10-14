require 'spec_helper'

describe 'trello_cards' do
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

  it 'can create a card' do

    api_key = ENV['TRELLO_API_KEY']
    auth_token = ENV['TRELLO_AUTH_TOKEN']
    list_id = @list.id
    name = 'Foo'

    service_instance = service_instance('trello_cards')

    params = {
      'list_id' => list_id,
      'name' => name,
      'auth_token' => auth_token,
      'api_key' => api_key
    }

    service_instance.test_action('create_card', params) do
      expect_info message: 'Initializing connection to Trello'
      expect_info message: 'Creating new card'
      expect_return
    end
  end

  it 'can find a card' do

    api_key = ENV['TRELLO_API_KEY']
    auth_token = ENV['TRELLO_AUTH_TOKEN']
    card_id = @card.id

    service_instance = service_instance('trello_cards')

    params = {
      'card_id' => card_id,
      'auth_token' => auth_token,
      'api_key' => api_key
    }

    service_instance.test_action('find_card', params) do
      expect_info message: 'Initializing connection to Trello'
      expect_info message: 'Finding card'
      expect_return
    end
  end
end
