'use strict'

describe 'Controller: CardController', ->

  # load the controller's module
  beforeEach module 'flashCardApp'

  CardController = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    CardController = $controller 'CardController', {
      $scope: scope
    }