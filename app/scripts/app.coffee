'use strict'

app = angular.module('App', [
		'ngCookies',
		'ngResource',
		'ngSanitize',
		'ngRoute',
		'ngAnimate'
	])

app.config ($routeProvider)->
	$routeProvider
		.when '/',
			templateUrl: 'views/start.html'
			controller: 'StartController'
		.when '/Cards/:cardsId',
			templateUrl: 'views/card.html',
			controller: 'CardController',
		.otherwise
			redirectTo: '/'
		return