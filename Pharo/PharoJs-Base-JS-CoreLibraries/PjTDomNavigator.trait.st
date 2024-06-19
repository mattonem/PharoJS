Trait {
	#name : 'PjTDomNavigator',
	#category : 'PharoJs-Base-JS-CoreLibraries-Controllers',
	#package : 'PharoJs-Base-JS-CoreLibraries',
	#tag : 'Controllers'
}

{ #category : 'accessing' }
PjTDomNavigator >> document [
	self explicitRequirement
]

{ #category : 'accessing' }
PjTDomNavigator >> elementAt: elementId [
	^self document getElementById: elementId
]

{ #category : 'accessing' }
PjTDomNavigator >> elementAt: childId in: container [
	"Method querySelector: Returns the first child element that matches a specified 
	CSS selector(s) of an element. To search for an element by Id, we need to use
	a sharp (#) as prefix. A dot (.) should be used for searching by class"
	^container querySelector: '#', childId.
]
