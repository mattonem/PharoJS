Extension { #name : 'PjTArray' }

{ #category : '*PharoJs-Base-Serialization' }
PjTArray classSide >> instantiateWithPhxJsonReader: reader instanceJsonObject: jsonObject [
	| resultCollection elements |
	resultCollection := self new: jsonObject size.
	reader addKnownObject: resultCollection.
	elements := jsonObject collect: [ :each | reader readFromJsObjectOrDictionary: each ].
	elements withIndexDo: [ : anElement : index | resultCollection at: index put: anElement ].
	^resultCollection
]
