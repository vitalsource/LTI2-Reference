Lti2Tp::Engine.routes.draw do

  resources :registrations

  match 'reregistrations' => 'deployment_proposals#reregister', :via => :post

end
