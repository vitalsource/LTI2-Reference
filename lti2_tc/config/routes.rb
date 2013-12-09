Lti2Tc::Engine.routes.draw do
  get "tools_controller/create"
  get "tools_controller/show"
  get "tool_settings_controller/show"
  get "tool_settings_controller/update"
  get "tool_proxies_controller/index"
  get "tool_consumer_profiles/index"
  get "tool_consumer_profiles/show"
  get "deployment_requests/show"
end
