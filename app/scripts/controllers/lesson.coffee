'use strict'

angular.module('App')
	.controller 'LessonController', ($scope,$timeout) ->
		$timeout ()->
			$scope.lesson = 
				name : ''
				description : ''
			$scope.selectedLanguage = [
				'FR'
				'JP1'
				'EN'
			]
			$scope.lang = 
				'FR':'Français'
				'EN':'English'
				'JP1':'Japonais'
			
			$scope.wordsByLang = {
				'FR':[
					'Bonjour'
					'Au revoir'
				],
				'JP1':[
					'おはようざいます'
					'マた'
				],
				'EN':[
					'おはようざいます'
					'マた'
				]
			}
			totalWord = $scope.wordsByLang[$scope.selectedLanguage[0]].length
			totalLang = $scope.selectedLanguage.length;
			$scope.words = []
			for i in [0...totalWord] by 1
				$scope.words[i] = []
				for j in [0...totalLang] by 1
					$scope.words[i][j] = $scope.wordsByLang[$scope.selectedLanguage[j]][i]

			console.log $scope.words
			
			
			$scope.$apply()