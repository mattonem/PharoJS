Class {
	#name : 'PjClassFactoryTestResource',
	#superclass : 'TestResource',
	#instVars : [
		'classFactory',
		'defaultClass'
	],
	#category : 'PharoJs-Base-Transpiler-Tests-Support',
	#package : 'PharoJs-Base-Transpiler-Tests',
	#tag : 'Support'
}

{ #category : 'running' }
PjClassFactoryTestResource >> classFactory [
	^classFactory
]

{ #category : 'running' }
PjClassFactoryTestResource >> defaultClass [
	^defaultClass
]

{ #category : 'running' }
PjClassFactoryTestResource >> setUp [
	super setUp.
	classFactory := ClassFactoryForTestCase new.
	defaultClass := classFactory silentlyNewClass
]

{ #category : 'running' }
PjClassFactoryTestResource >> tearDown [
	classFactory cleanUp.
	super tearDown.

]
