require 'factor-connector-api'

Factor::Connector.service 'trello_cards' do
  action 'list' do |params|
    info "Getting list of cards"

    api_key = params['api_key']

    fail "API Key required" unless api_key

    action_callback message: "card has been moved"
  end
end