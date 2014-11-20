Lti2Tp::Engine.routes.draw do

  resources :registrations

  match 'reregistrations' => 'registrations#reregister', :via => :post

  match 'tool_proxies/:id' => 'registrations#end_registration', :via => :put

end
