Lti2Tp::Engine.routes.draw do

  resources :registrations

  match 'reregistrations' => 'registrations#reregister', :via => :post

  match 'tool_proxies/:id' => 'registrations#complete_reregistration', :via => :put
  match 'tool_proxies/:id' => 'registrations#complete_reregistration', :via => :delete

end
