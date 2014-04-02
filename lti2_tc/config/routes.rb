Lti2Tc::Engine.routes.draw do

  get 'tool_proxies_controller/index'

  resources :tool_consumer_profiles

  resources :deployment_requests

  resources :tools

  get 'tool_settings/:tool_guid'                  => 'tool_settings#show'
  get 'tool_settings/:tool_guid/context/:node_id' => 'tool_settings#show'
  get 'tool_settings/:tool_guid/ltilink/:node_id' => 'tool_settings#show'

  put 'tool_settings/:tool_guid'                  => 'tool_settings#update'
  put 'tool_settings/:tool_guid/context/:node_id' => 'tool_settings#update'
  put 'tool_settings/:tool_guid/ltilink/:node_id' => 'tool_settings#update'

end
