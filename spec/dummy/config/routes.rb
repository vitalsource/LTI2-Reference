Rails.application.routes.draw do

  mount Lti2::Engine => "/lti2"
end
