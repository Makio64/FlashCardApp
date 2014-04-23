'use strict'

angular.module('flashCardApp')
	.controller 'CardController', ($scope,$http,$routeParams,$location,$cookieStore,$timeout) ->

		$scope.shuffle = $cookieStore.get('shuffle')
		$scope.autoNext = $cookieStore.get('autoNext')
		$scope.nextDelay = $cookieStore.get('nextDelay')

		$http.get('./datas/lessons.json', {}).then((res)->
			$scope.words = res.data.lessons
			$scope.words = res.data.lessons[$routeParams.cardsId-1].words
			if $scope.shuffle
				$scope.words = $scope.shuffleProperties($scope.words)
			$scope.total = $scope.count(res.data.lessons[$routeParams.cardsId-1].words)
		)

		$scope.count = (obj)->
			count = 0
			for k of obj
				++count  if obj.hasOwnProperty(k)
			return count

		$scope.notSorted = (obj)->
			if (!obj)
				return []
			return Object.keys(obj)

		$scope.random = ()->
			return 0.5 - Math.random()

		$scope.answerReveal = false
		$scope.total = 0
		$scope.currentId = 0

		$scope.next = ()->
			$scope.answerReveal = false
			$scope.currentId++
			if $scope.currentId == $scope.total
				$location.path( '/' )
			return

		$scope.startTimer = ()->
			$timeout.cancel($scope.timer)
			$scope.timer = $timeout($scope.next,$scope.nextDelay)	
			return

		$scope.cancelTimer = ()->
			$timeout.cancel($scope.timer)	
			return

		$scope.onClick = ()->
			if $scope.answerReveal
				if($scope.autoNext)
					$scope.cancelTimer()
				$scope.next()
			else
				if($scope.autoNext)
					$scope.startTimer()

				$scope.answerReveal = true
				audio = document.createElement('audio');
				words = encodeURIComponent(String($scope.words[$scope.getKeys($scope.words)[$scope.currentId]]))
				audio.setAttribute('src', 'http://www.translate.google.com/translate_tts?tl=fr&q=' + words);
				audio.load();
				audio.play();

			return

		$scope.shuffleProperties = (obj) ->
			newObj = {}
			keys = $scope.getKeys(obj)
			keys.sort( ()->
				Math.round(Math.random())-0.5
			);
			for key of keys
				console.log key,keys[key],obj[keys[key]]
				newObj[String(keys[key])] = obj[keys[key]]
			console.log newObj
			return newObj

		$scope.getKeys = (obj) ->
			arr = new Array()
			for key of obj
				arr.push key
			return arr