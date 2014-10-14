require 'spec_helper'

describe 'trello_lists' do
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
end
