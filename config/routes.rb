Lti2::Engine.routes.draw do
  mount Lti2Tc::Engine => '/lti2_tc'
  mount Lti2Tp::Engine => '/lti2_tp'
end