'use strict'

app = angular.module('App', [
		'ngCookies',
		'ngResource',
		'ngSanitize',
		'ngRoute',
		'ngAnimate'
	])

app.path = 
	host:'http://makiopolis.com/flashcards/'
	service:'http://makiopolis.com/flashcards/php/'

app.config ($routeProvider)->
	$routeProvider
		.when '/',
			templateUrl: 'views/start.html'
			controller: 'StartController'
		.when '/Cards/:cardsId',
			templateUrl: 'views/card.html',
			controller: 'CardController',
		.when '/lesson/add',
			templateUrl: 'views/lesson.html'
			controller: 'LessonController'
		.otherwise
			redirectTo: '/'
		return