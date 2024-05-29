Class {
	#name : 'PjUser',
	#superclass : 'Object',
	#instVars : [
		'name'
	],
	#category : 'PharoJs-Examples-HelloWorld',
	#package : 'PharoJs-Examples',
	#tag : 'HelloWorld'
}

{ #category : 'accessing' }
PjUser >> name [
	^name
]

{ #category : 'accessing' }
PjUser >> name: anObject [
	name := anObject
]
