Lumos::Application.routes.draw do

  resources :registries
  resources :deployment_requests
  resources :tool_consumer_profiles
  resources :tools
  resources :results

  get 'tool_settings/:tool_guid', :to => 'tool_settings#show'
  get 'tool_settings/:tool_guid/context/:node_id', :to => 'tool_settings#show'
  get 'tool_settings/:tool_guid/ltilink/:node_id', :to => 'tool_settings#show'

  put 'tool_settings/:tool_guid', :to => 'tool_settings#update'
  put 'tool_settings/:tool_guid/context/:node_id', :to => 'tool_settings#update'
  put 'tool_settings/:tool_guid/ltilink/:node_id', :to => 'tool_settings#update'

  match "docs", :to => "docs#show"
  
  get "home/index"

  root :to => "home#index"

  ActiveAdmin.routes(self)

  post '/admin/register_new_tool', :to => 'admin/register_new_tool#index'

  devise_for :admin_users, ActiveAdmin::Devise.config

end
