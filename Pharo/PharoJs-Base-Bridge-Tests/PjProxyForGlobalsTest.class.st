Class {
	#name : 'PjProxyForGlobalsTest',
	#superclass : 'TestCase',
	#instVars : [
		'classFactory',
		'authorInitialName'
	],
	#category : 'PharoJs-Base-Bridge-Tests-Tests',
	#package : 'PharoJs-Base-Bridge-Tests',
	#tag : 'Tests'
}

{ #category : 'running' }
PjProxyForGlobalsTest >> setUp [

	super setUp.
	authorInitialName := Author uniqueInstance fullNamePerSe.
	Author uniqueInstance fullName: 'PharoJS'.
	classFactory := ClassFactoryForTestCase new
]

{ #category : 'running' }
PjProxyForGlobalsTest >> tearDown [

	super tearDown.
	classFactory ifNotNil: [ classFactory cleanUp ].
	Author uniqueInstance fullName: authorInitialName.
]

{ #category : 'tests' }
PjProxyForGlobalsTest >> testProxyForNewGlobalsCreated [

	| globalsPool userClass |
	globalsPool := classFactory silentlyMake: [ :aBuilder |
		               aBuilder
			               superclass: PjJavascriptGlobals;
			               sharedVariablesFromString: 'A B' ].
	userClass := classFactory silentlyMake: [ :aBuilder |
		             aBuilder sharedPools: { globalsPool name } ].
	userClass class compile: 'globals
		^{A. B}'.
	userClass globals do: [ :each |
		self assert: (each isKindOf: PjProxy) ]
]
