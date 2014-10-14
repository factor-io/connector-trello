require 'spec_helper'

describe 'trello_lists' do
  it 'can create a list' do

    api_key = ENV['TRELLO_API_KEY']
    auth_token = ENV['TRELLO_AUTH_TOKEN']
    board_id = ENV['TRELLO_BOARD_ID']
    name = 'FooFoo'

    service_instance = service_instance('trello_lists')

    params = {
      'board_id' => board_id,
      'name' => name,
      'auth_token' => auth_token,
      'api_key' => api_key
    }

    service_instance.test_action('create_list', params) do
      expect_info message: 'Initializing connection to Trello'
      expect_info message: 'Creating new list'
      expect_return
    end
  end
end
