Class {
	#name : 'PjMinimalExpressApp',
	#superclass : 'PjExpressApp',
	#instVars : [
		'data'
	],
	#category : 'PharoJs-Examples-ExpressJS',
	#package : 'PharoJs-Examples',
	#tag : 'ExpressJS'
}

{ #category : 'accessing' }
PjMinimalExpressApp class >> publicStaticFilesFolderName [
	^#public
]

{ #category : 'initialization' }
PjMinimalExpressApp >> initialize [

	super initialize.
	server get: '/data' handler: [ :req :res | res send: data ].
	server post: '/data' handler: [ :req :res |
		data := req body.
		res send: data ]
]
