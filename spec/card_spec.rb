require 'spec_helper'

describe 'trello_cards' do
  it 'can create a card' do

    api_key = ENV['TRELLO_API_KEY']
    auth_token = ENV['TRELLO_AUTH_TOKEN']
    list_id = ENV['TRELLO_LIST_ID']
    name = 'Foo'

    service_instance = service_instance('trello_cards')

    params = {
      'list_id' => list_id,
      'name' => name
    }

    service_instance.test_action('create_card', params) do
      expect_info message: 'Initializing connection to Trello'
      expect_info message: 'Creating new card'
      expect_return
    end
  end
end
