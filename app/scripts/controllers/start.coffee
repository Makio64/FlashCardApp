'use strict'

angular.module('flashCardApp')
	.controller 'StartController', ($scope, $http, $cookieStore) ->
		$scope.autoNext = $cookieStore.get('autoNext')
		$scope.nextDelay = $cookieStore.get('nextDelay')
		$scope.shuffle = $cookieStore.get('shuffle')

		$http.get('./datas/lessons.json', {}).then((res)->
			$scope.lessons = res.data.lessons
			$scope.lesson = $scope.lessons[0]
		)

		$scope.saveCookies = ()->
			$cookieStore.put('nextDelay', $scope.nextDelay)
			$cookieStore.put('autoNext', $scope.autoNext)
			$cookieStore.put('shuffle', $scope.shuffle)
