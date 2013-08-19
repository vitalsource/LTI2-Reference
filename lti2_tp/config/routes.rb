Fabericious::Application.routes.draw do

  resources :deployment_proposals

  resources :echoes
  resources :settings
  resources :books
  resources :bookshelves
  resources :bookselections
  resources :iresources
  
  match 'reregistrations' => 'deployment_proposals#reregister', :via => :post

  root :to => "home#index"

end
