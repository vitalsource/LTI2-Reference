Lumos::Application.routes.draw do

  resources :registries
  resources :deployment_requests
  resources :tool_consumer_profiles
  resources :tools
  resources :results

  get 'tool_settings/:tool_guid', :to => 'tool_settings#show'
  get 'tool_settings/:tool_guid/context/:node_id', :to => 'tool_settings#show'
  get 'tool_settings/:tool_guid/ltilink/:node_id', :to => 'tool_settings#show'

  
  match "docs", :to => "docs#show"
  
  get "home/index"

  root :to => "home#index"
  
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

end
