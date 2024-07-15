Class {
	#name : 'PjHtmlCollectionTest',
	#superclass : 'PjArrayLikeCollectionTest',
	#category : 'PharoJs-Base-JS-CoreLibraries-Tests-Collections',
	#package : 'PharoJs-Base-JS-CoreLibraries-Tests',
	#tag : 'Collections'
}

{ #category : 'accessing - defaults' }
PjHtmlCollectionTest >> defaultCollection [
	^ document body children
]
