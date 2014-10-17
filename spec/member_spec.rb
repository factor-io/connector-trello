require 'spec_helper'

describe 'Trello' do
  describe 'Member' do
    it 'can find a member' do

      api_key = ENV['TRELLO_API_KEY']
      auth_token = ENV['TRELLO_AUTH_TOKEN']
      member_id = ENV['TRELLO_MEMBER_ID']
      board_id = @board.id
      card_id = @card.id

      service_instance = service_instance('trello_members')

      params = {
        'member_id' => member_id,
        'board_id' => board_id,
        'card_id' => card_id,
        'auth_token' => auth_token,
        'api_key' => api_key
      }

      service_instance.test_action('find', params) do
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

      service_instance.test_action('assign', params) do
        expect_info message: 'Initializing connection to Trello'
        expect_info message: 'Adding member to card'
        expect_return
      end
    end
  end
end
