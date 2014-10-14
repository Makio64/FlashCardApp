'use strict'

angular.module('App')
	.controller 'StartController', ($scope, $http, $cookieStore, $cookies, $timeout)->

		$timeout ()->
			if !$cookies.setup
				$cookieStore.put('nextDelay', 1000)
				$cookieStore.put('autoNext', true)
				$cookieStore.put('shuffle', false)
				$cookieStore.put('order', 'Random')
				$cookies.setup = true

			$scope.$apply ()->
				$scope.orders = {
					'Normal':'Normal'
					'Inverted':'Inverted'
					'Random':'Random'
				}
				$scope.autoNext = $cookieStore.get('autoNext')
				$scope.nextDelay = $cookieStore.get('nextDelay')
				$scope.shuffle = $cookieStore.get('shuffle')
				$scope.order = $cookieStore.get('order')

		$http.get('./datas/lessons.json', {}).then((res)->
			$scope.lessons = res.data.lessons
			$scope.lesson = $scope.lessons[0]
		)

		$scope.saveCookies = ()->
			console.log $scope.order
			$cookieStore.put('nextDelay', $scope.nextDelay)
			$cookieStore.put('autoNext', $scope.autoNext)
			$cookieStore.put('shuffle', $scope.shuffle)
			$cookieStore.put('order', $scope.order)
