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
a new LTI2 ToolConsumer.  It must implement the following paths:

a. Register action

The register action gives this controller the ingredients needed to do tool-specific validation, customization and
creation of the ToolProxy.

POST /lti_register_wip?action=register
request content-type: application/json
```javascript
{
    "service_owner_name": <string>,
    "lti_version": <string>,
    "tool_consumer_profile", <text>,
    "tool_profile", <text>,
    "registration_return_url", <url>
}
```

Use the tool_consumer_profile and tool_profile to generate a tool_proxy (or to reject it).  When this action is
complete do one of the following:

On success: redirect_to <registration_return_url>, action: 'accept_tool_proxy', id: <a_lti_register_wip_id>

On failure: redirect_to <registration_return_url>, action: 'reject_registration', status: <integer>,
                                    message: <string>


b. Get ToolProxy

Gets the currently computed tool_proxy (or empty if not computed).

GET /lti_register_wip/:id
response content-type: application/json
<tool_proxy>


c. Update secret

Do whatever is necessary to update the shared secret.  This is typically used at the last phase of registration.

PUT /lti_register_wip/:id/secret
request content-type: application/json
{"secret": <string}


