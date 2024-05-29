Class {
	#name : 'PjSubclassForInitTest',
	#superclass : 'PjClassForInitTest',
	#instVars : [
		'y'
	],
	#category : 'PharoJs-Base-Bridge-Tests-Initialization',
	#package : 'PharoJs-Base-Bridge-Tests',
	#tag : 'Initialization'
}

{ #category : 'initialization' }
PjSubclassForInitTest >> initialize [ 
	super initialize.
	y := 'PharoJS'
]

{ #category : 'accessing' }
PjSubclassForInitTest >> y [

	^ y
]

{ #category : 'accessing' }
PjSubclassForInitTest >> y: anObject [

	y := anObject
]
