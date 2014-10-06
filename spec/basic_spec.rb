require 'spec_helper'

describe 'Trello' do
  describe 'Cards' do 
    it 'can list cards' do

      service_instance = service_instance('trello_cards')

      received_payload = false
      service_instance.callback = proc do |action_response|
        if action_response[:payload]
          received_payload = true
        end
      end

      params={
        'api_key' => 'abc'
      }

      service_instance.call_action('list',params)

      eventually timeout: 10 do
        received_payload
      end
    end
  end
end