'use strict'

describe 'Controller: LessonCtrl', ->

  # load the controller's module
  beforeEach module 'appApp'

  LessonCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    LessonCtrl = $controller 'LessonCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
