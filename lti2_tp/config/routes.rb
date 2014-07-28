Lti2Tp::Engine.routes.draw do
  resources :registrations

  match 'reregistrations' => 'registrations#reregister', :via => :post
end