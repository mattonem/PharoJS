Extension { #name : #PjDictionary }

{ #category : #'*PharoJs-Base-Serialization' }
PjDictionary class >> phxJsonClassName [
	^ 'Dictionary'
]

{ #category : #'*PharoJs-Base-Serialization' }
PjDictionary >> writePhxJsonRepresentationOn: w [

	| oneKeyWritten |
	oneKeyWritten := false.
	w doBetweenCurlyBraces: [
		self keysAndValuesDo: [ :key :val |
			oneKeyWritten ifTrue: [ w comma ].
			w writeKeyName: key andValue: [ val writePhxJsonOn: w ].
			oneKeyWritten := true ] ]
]
