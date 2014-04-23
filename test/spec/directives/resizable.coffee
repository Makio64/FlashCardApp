'use strict'

describe 'Directive: resizable', ->

  # load the directive's module
  beforeEach module 'flashCardAppApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<resizable></resizable>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the resizable directive'
