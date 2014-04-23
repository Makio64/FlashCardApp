'use strict'

angular
	.module('flashCardApp', [
		'ngCookies',
		'ngResource',
		'ngSanitize',
		'ngRoute',
		'ngAnimate'
	])
	.config ($routeProvider) ->
		$routeProvider
			.when '/',
				templateUrl: 'views/start.html'
				controller: 'StartController'
			.when '/Cards/:cardsId',
				templateUrl: 'views/card.html',
				controller: 'CardController',
			.otherwise
				redirectTo: '/'