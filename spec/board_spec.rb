require 'spec_helper'

describe 'Trello' do
  describe 'Board' do
    it 'can create a board' do

      api_key = ENV['TRELLO_API_KEY']
      auth_token = ENV['TRELLO_AUTH_TOKEN']
      name = 'Roo'

      service_instance = service_instance('trello_boards')

      params = {
        'name' => name,
        'auth_token' => auth_token,
        'api_key' => api_key
      }

      service_instance.test_action('create_board', params) do
        expect_info message: 'Initializing connection to Trello'
        expect_info message: 'Creating new board'
        expect_return
      end
    end

    it 'can find a board' do

      api_key = ENV['TRELLO_API_KEY']
      auth_token = ENV['TRELLO_AUTH_TOKEN']
      board_id = @board.id

      service_instance = service_instance('trello_boards')

      params = {
        'board_id' => board_id,
        'auth_token' => auth_token,
        'api_key' => api_key
      }

      service_instance.test_action('find_board', params) do
        expect_info message: 'Initializing connection to Trello'
        expect_info message: 'Finding board'
        expect_return
      end
    end
  end
end
