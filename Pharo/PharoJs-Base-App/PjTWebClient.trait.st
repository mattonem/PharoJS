Trait {
	#name : 'PjTWebClient',
	#category : 'PharoJs-Base-App',
	#package : 'PharoJs-Base-App'
}

{ #category : 'http support' }
PjTWebClient >> fetch: path [
	<javascript: 'return window.fetch(path)'>
]

{ #category : 'http support' }
PjTWebClient >> fetch: path with: data [

	<javascript: 'return window.fetch(path, data)'>
	
]

{ #category : 'http operations' }
PjTWebClient >> get: path withTextDo: thenBlock [

	self
		get: path
		withTextDo: thenBlock
		onErrorDo: [ :error | self logError: error onGet: path ]
]

{ #category : 'http operations' }
PjTWebClient >> get: path withTextDo: thenBlock onErrorDo: errorBlock [

	(self fetch: path)
		then: [ :response |
			response text
				then: thenBlock;
				catch: errorBlock ];
		catch: errorBlock
]

{ #category : 'logging' }
PjTWebClient >> log: aString [

	<javascript: 'console.log(aString)'>
	
]

{ #category : 'logging' }
PjTWebClient >> logError: aString [

	<javascript: 'console.error(aString)'>
	
]

{ #category : 'logging' }
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

{ #category : 'logging' }
PjTWebClient >> logError: error onGet: path [

	self logError: error on: 'GET' path: path
]

{ #category : 'logging' }
PjTWebClient >> logError: error onPost: path [

	self logError: error on: 'POST' path: path
]

{ #category : 'http operations' }
PjTWebClient >> post: path text: aString [ 
self post: path text: aString then: [ self log: 'Done POST to ', path ]
]

{ #category : 'http operations' }
PjTWebClient >> post: path text: aString then: thenBlock [

	self
		post: path
		text: aString
		then: thenBlock
		catch: [ :error | self logError: error onPost: path ]
]

{ #category : 'http operations' }
PjTWebClient >> post: path text: aString then: thenBlock catch: errorBlock [

	(self fetch: path with: {
				 (#method -> 'POST').
				 (#body -> aString) } asJsObject)
		then: thenBlock;
		catch: errorBlock
]
