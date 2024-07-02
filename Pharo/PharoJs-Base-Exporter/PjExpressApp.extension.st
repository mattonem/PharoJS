Extension { #name : 'PjExpressApp' }

{ #category : '*PharoJs-Base-Exporter' }
PjExpressApp class >> afterExportApp [

	<pharoJsSkip>
	super afterExportApp.
	self isExportingClients ifFalse: [ ^self ].
	self clientAppClasses do: #exportApp
]

{ #category : '*PharoJs-Base-Exporter' }
PjExpressApp class >> clientAppClasses [

	<pharoJsSkip>
	^ #(  ) 
]

{ #category : '*PharoJs-Base-Exporter' }
PjExpressApp class >> isExportingClients [
	^isExportingClients ifNil: [ true ].
	
]

{ #category : '*PharoJs-Base-Exporter' }
PjExpressApp class >> isExportingClients: aBoolean [
	isExportingClients := aBoolean
	
]

{ #category : '*PharoJs-Base-Exporter' }
PjExpressApp class >> noClientExportDuring: aBlock [
	self appClass isExportingClients: false.
	aBlock ensure: [self appClass isExportingClients: true].

]
