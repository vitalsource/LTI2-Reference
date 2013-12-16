Lti2_Tp -- Tool Provider
========================

Lti2_Tp is a Rails gem (implemented here as a mountable Rails engine) that implements the Tool Provider of Lti2.  It
can be added to a Rails application by adding the following to the application.

1. Mount the Rails engine within the application's routes.rb file:

```ruby
MyToolApp::Application.routes.draw do

  mount Lti2Tp::Engine, at: '/lti2_tp'
  ...
  <rest of routes.rb>
```

2. Mixin Lti2_Tp migrations with the application's own migrations:

```
rake lti2_tc:install:migrations
```

3. Implement a application-specific LtiRegistrationsController class in the application (not in Lti2_Tp).

The LtiRegistrationsController is needed to implement the specific user interface, models or other behavior to register
a new LTI2 ToolConsumer.

It must implement the following incoming REST service:

```javascript
POST /lti_register_wip
content-type: application/json
{
    "service_owner_name": <string>,
    "lti_version": <string>,
    "tool_consumer_profile", <text>,
    "tool_profile", <text>,
    "tenant_name", <string>,
    "tool_proxy", <text>,
    "state", <string>,
    "result_status", <integer>,
    "result_message", <string>,
}
```

