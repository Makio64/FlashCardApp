'use strict'

angular.module('App')
	.controller 'CardController',($scope,$http,$routeParams,$location,$cookieStore,$timeout)->

		$scope.shuffle = $cookieStore.get('shuffle')
		$scope.autoNext = $cookieStore.get('autoNext')
		$scope.nextDelay = $cookieStore.get('nextDelay')
		$scope.order = $cookieStore.get('order')

		$http.get('./datas/lessons.json', {}).then((res)->
			$scope.words = res.data.lessons
			$scope.words = res.data.lessons[$routeParams.cardsId-1].words
			if $scope.shuffle
				$scope.words = $scope.shuffleProperties($scope.words)
			if $scope.order == 'Inverted'
				$scope.words = $scope.exchangeKeyValue($scope.words)
			else if $scope.order == 'Random'
				$scope.words = $scope.randomizeKeyValue($scope.words)
			
			console.log $scope.order
			
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

				words = encodeURIComponent(String($scope.words[$scope.getKeys($scope.words)[$scope.currentId]]))
				url   = './php/voice.php?q=' + words + '&tl=fr'
				sound = new Howl(
					urls: [url]
					autoplay: true
					loop: false
					volume: 1.0
					buffer: true
					format: 'mp3'
				).play()
				# console.log sound

			return

		$scope.randomizeKeyValue = (obj,percent=.5) ->
			console.log 'randomizeKeyValue'
			newObj = {}
			for key of obj
				if Math.random()>percent 
					#invert
					newObj[String(obj[key])] = key
				else 
					#copy
					newObj[String(key)]=String(obj[key])

			return newObj
			

		$scope.exchangeKeyValue = (obj) ->
			console.log 'exchangeKeyValue'
			return $scope.randomizeKeyValue(obj,0)


		$scope.shuffleProperties = (obj) ->
			newObj = {}
			keys = $scope.getKeys(obj)
			keys.sort( ()->
				Math.round(Math.random())-0.5
			);
			for key of keys
				newObj[String(keys[key])] = obj[keys[key]]
			return newObj

		$scope.getKeys = (obj) ->
			arr = new Array()
			for key of obj
				arr.push key
			return arr