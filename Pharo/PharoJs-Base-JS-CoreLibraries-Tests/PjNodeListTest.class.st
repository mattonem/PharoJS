Class {
	#name : 'PjNodeListTest',
	#superclass : 'PjArrayLikeCollectionTest',
	#category : 'PharoJs-Base-JS-CoreLibraries-Tests-Collections',
	#package : 'PharoJs-Base-JS-CoreLibraries-Tests',
	#tag : 'Collections'
}

{ #category : 'accessing - defaults' }
PjNodeListTest >> defaultCollection [
	^ document body childNodes
]

{ #category : 'tests' }
PjNodeListTest >> testAllButFirst [
	self assert: collection allButFirst size equals: collection size - 1.
]

{ #category : 'tests' }
PjNodeListTest >> testCollectionIsNotEmpty [
	self assert: collection notEmpty.
	self deny: collection isEmpty
]
