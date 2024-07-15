Class {
	#name : 'PjProxyDisconnectionTest',
	#superclass : 'TestCase',
	#traits : 'PjTWaitUntilReady',
	#classTraits : 'PjTWaitUntilReady classTrait',
	#instVars : [
		'bridge'
	],
	#pools : [
		'PjDomGlobals'
	],
	#category : 'PharoJs-Base-Bridge-Tests-Tests',
	#package : 'PharoJs-Base-Bridge-Tests',
	#tag : 'Tests'
}

{ #category : 'tests' }
PjProxyDisconnectionTest >> setUp [
	super setUp.
	bridge := PjMinimalWebApplication bridge.
	bridge start.

]

{ #category : 'tests' }
PjProxyDisconnectionTest >> tearDown [
	bridge stop.
	super tearDown.

]

{ #category : 'tests' }
PjProxyDisconnectionTest >> testMessageDisconnectedBridge [

	| jsObject jsArray |
	jsObject := bridge evalBlock: [ Object new ].
	self assert: jsObject jsClassName equals: Object name.
	bridge terminateClient.
	self waitWhile: [ bridge isConnected ].
	self
		should: [ jsObject jsClassName ]
		raise: PjBridgeDisconnectedError.
	bridge startJsInterpreter.
	self waitUntil: [ bridge isConnected ].
	self should: [ jsObject jsClassName ] raise: PjJavascriptError.
	jsArray := bridge evalBlock: [ #( 1 2 3 ) ].
	self assert: jsArray second equals: 2
]
