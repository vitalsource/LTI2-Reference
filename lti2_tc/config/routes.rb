Lumos::Application.routes.draw do

  resources :registries
  resources :deployment_requests
  resources :tool_consumer_profiles
  resources :tools
  resources :results
  resources :tool_settings
  
  match "docs", :to => "docs#show"
  
  get "home/index"

  root :to => "home#index"
  
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

end
