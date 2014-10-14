require 'factor-connector-api'
require 'trello'

Factor::Connector.service 'trello_members' do
  action 'find_member' do |params|

    member_id = params['member_id']
    api_key = params['api_key']
    auth_token = params['auth_token']

    fail 'A member ID is required' unless member_id

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
      member = Trello::Member.find(member_id)
    rescue
      'Failed to find member'
    end

    action_callback member
  end
end
