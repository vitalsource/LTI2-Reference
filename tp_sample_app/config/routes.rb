Fabericious::Application.routes.draw do

  mount Lti2Tp::Engine, at: '/lti2_tp'

  resources :echoes
  resources :settings
  resources :books
  resources :bookshelves
  resources :bookselections
  resources :iresources
  resources :lti_registration_wips
  
  post 'lti_registrations', to: 'lti_registrations#create', as: 'lti_registration'
  
  root :to => "home#index"

end
