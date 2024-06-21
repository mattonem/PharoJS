Trait {
	#name : #PjTWebClient,
	#category : #'PharoJs-Base-App'
}

{ #category : #'http support' }
PjTWebClient >> fetch: path [
	<javascript: 'return window.fetch(path)'>
]

{ #category : #'http support' }
PjTWebClient >> fetch: path with: data [

	<javascript: 'return window.fetch(path, data)'>
	
]

{ #category : #'http operations' }
PjTWebClient >> get: path withTextDo: thenBlock [

	self
		get: path
		withTextDo: thenBlock
		onErrorDo: [ :error | self logError: error onGet: path ]
]

{ #category : #'http operations' }
PjTWebClient >> get: path withTextDo: thenBlock onErrorDo: errorBlock [

	(self fetch: path)
		then: [ :response |
			response text
				then: thenBlock;
				catch: errorBlock ];
		catch: errorBlock
]

{ #category : #logging }
PjTWebClient >> log: aString [

	<javascript: 'console.log(aString)'>
	
]

{ #category : #logging }
PjTWebClient >> logError: aString [

	<javascript: 'console.error(aString)'>
	
]

{ #category : #logging }
PjTWebClient >> logError: error on: httpOperationName path: path [

	| notification |
	notification := String streamContents: [ :str |
		                str
		<< httpOperationName;
			                space;
			                << path;
			                << ' error. ';
			                cr;
			                << error message ].
	^ self logError: notification
]

{ #category : #logging }
PjTWebClient >> logError: error onGet: path [

	self logError: error on: 'GET' path: path
]

{ #category : #logging }
PjTWebClient >> logError: error onPost: path [

	self logError: error on: 'POST' path: path
]

{ #category : #'form support' }
PjTWebClient >> newFormData [
	<javascript: 'new FormData()'>
]

{ #category : #'form support' }
PjTWebClient >> newFormDataWithAll: associations [

	| formData |
	formData := self newFormData.
	associations asDictionary keysAndValuesDo: [ :key :value |
		formData append: key value: value ].
	^ formData
]

{ #category : #'http operations' }
PjTWebClient >> post: path body: anObject [

	self
		post: path
		body: anObject
		then: [ self log: 'Done POST to ' , path ]
]

{ #category : #'http operations' }
PjTWebClient >> post: path body: anObject then: thenBlock [

	self
		post: path
		body: anObject
		then: thenBlock
		catch: [ :error | self logError: error onPost: path ]
]

{ #category : #'http operations' }
PjTWebClient >> post: path body: anObject then: thenBlock catch: errorBlock [

	(self fetch: path with: {
				 (#method -> 'POST').
				 (#body -> anObject) } asJsObject)
		then: thenBlock;
		catch: errorBlock
]
