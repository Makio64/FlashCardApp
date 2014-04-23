'use strict'

describe 'Controller: StartCtrl', ->

  # load the controller's module
  beforeEach module 'flashCardApp'

  StartCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    StartCtrl = $controller 'StartCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
