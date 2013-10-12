# For more information see: http://emberjs.com/guides/routing/

Acme.Router.map ->
  @resource 'about'
  @route 'patients', path: '/'

# Acme.PatientsRoute = Ember.Route.extend
#   setupController: (controller) -> controller.set('content', [])