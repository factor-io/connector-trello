require 'factor-connector-api'
require 'restclient'

Factor::Connector.service 'web' do
  listener 'hook' do
    start do |data|
      info 'starting webhook'
      hook_id = data['id'] || 'post'
      hook_url = web_hook id: hook_id do
        start do |_listener_start_params, hook_data, _req, _res|
          info 'Got a Web Hook POST call'
          post_data = hook_data.dup
          post_data.delete('service_id')
          post_data.delete('listener_id')
          post_data.delete('instance_id')
          post_data.delete('hook_id')
          post_data.delete('user_id')
          start_workflow response: post_data
        end
      end
      info "Webhook started at: #{hook_url}"
    end
    stop do |_data|
      info 'Stopping...'
    end
  end

  action 'post' do |params|
    contents  = params['params'] || {}
    headers   = params['headers'] || {}
    url       = params['url']

    fail 'URL is required' unless url

    begin
      contents = JSON.parse(contents) if contents.is_a?(String)
    rescue
      fail "Couldn't parse '#{contents}' as JSON"
    end

    begin
      headers = JSON.parse(headers) if headers.is_a?(String)
    rescue
      fail 'Couldnt parse header'
    end
    if contents
      info "Posting to `#{url}`"
      begin
        response = RestClient.post(url, contents, headers)
        action_callback response
      rescue
        fail "Couldn't call '#{url}'"
      end
    end
  end
end