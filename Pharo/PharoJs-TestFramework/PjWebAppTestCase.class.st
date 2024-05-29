Class {
	#name : 'PjWebAppTestCase',
	#superclass : 'PjAppTestCase',
	#traits : 'PjTWebAppTestCase',
	#classTraits : 'PjTWebAppTestCase classTrait',
	#pools : [
		'PjBrowserGlobals'
	],
	#category : 'PharoJs-TestFramework-Kernel',
	#package : 'PharoJs-TestFramework',
	#tag : 'Kernel'
}

{ #category : 'accessing' }
PjWebAppTestCase >> document [ 	
	^document
]

{ #category : 'accessing' }
PjWebAppTestCase >> window [

	^window
]
