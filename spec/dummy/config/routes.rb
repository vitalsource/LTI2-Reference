Rails.application.routes.draw do

  mount Lti2::Engine => "/lti2"
  mount Lti2Tc::Engine => '/lti2_tc'
  mount Lti2Tp::Engine => '/lti2_tp'
end
