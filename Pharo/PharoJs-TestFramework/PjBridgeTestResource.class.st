Class {
	#name : 'PjBridgeTestResource',
	#superclass : 'TestResource',
	#instVars : [
		'bridge',
		'appClass',
		'execEnv'
	],
	#classVars : [
		'OpenWebBrowserInBackground'
	],
	#category : 'PharoJs-TestFramework-Kernel',
	#package : 'PharoJs-TestFramework',
	#tag : 'Kernel'
}

{ #category : 'running' }
PjBridgeTestResource class >> appClassToExportFor: aTestAsserter [
	^aTestAsserter appClassToExport 
]

{ #category : 'running' }
PjBridgeTestResource class >> availableFor: aTestAsserter [

	super availableFor: aTestAsserter.
	self ensureAppClassFor: aTestAsserter.
	self current ensureFreshClient
]

{ #category : 'running' }
PjBridgeTestResource class >> ensureAppClassFor: aTestAsserter [

	self current appClass == aTestAsserter appClassToExport ifTrue: [ 
		^ self ].
	current := self new.
	current initFrom: aTestAsserter
]

{ #category : 'accessing' }
PjBridgeTestResource class >> isClientBrowserOpenedInBackground [
	^OpenWebBrowserInBackground ifNil: [ false ]
]

{ #category : 'accessing' }
PjBridgeTestResource class >> isClientBrowserOpenedInBackground: aBoolean [
	^OpenWebBrowserInBackground := aBoolean 
]

{ #category : 'accessing' }
PjBridgeTestResource class >> setWebBrowserOpenedInBackground [

	<script>
	self isClientBrowserOpenedInBackground: true
]

{ #category : 'accessing' }
PjBridgeTestResource class >> setWebBrowserOpenedInForeground [

	<script>
	self isClientBrowserOpenedInBackground: false
]

{ #category : 'accessing' }
PjBridgeTestResource >> appClass [
	^appClass
]

{ #category : 'accessing' }
PjBridgeTestResource >> bridge [
	^ bridge
]

{ #category : 'accessing' }
PjBridgeTestResource >> bridge: aBridge [
	bridge := aBridge.
]

{ #category : 'accessing' }
PjBridgeTestResource >> bridgeForAppClass [

	^ appClass bridge
]

{ #category : 'running' }
PjBridgeTestResource >> ensureFreshClient [
	super initialize.
		Stdio stdout
		nextPutAll: 'PjBridgeTestResource >> ensureFreshClient';
		lf .
	self bridge isConnected ifTrue: [ ^ self resetClient ].
	self startJsInterpreter
]

{ #category : 'initialization' }
PjBridgeTestResource >> initBridge [

	self bridge: self bridgeForAppClass.
	PjBridge soleBridge: self bridge
]

{ #category : 'initialization' }
PjBridgeTestResource >> initFrom: aTestAsserter [

	appClass := aTestAsserter appClassToExport.
	appClass resetAppFolder.
	self initBridge.
	self bridge shouldStartJsInterpreter: false.
	self setUpClient.
	self startBridge: 
		self bridge 
]

{ #category : 'initialization' }
PjBridgeTestResource >> initialize [
	super initialize.
		Stdio stdout
		nextPutAll: 'PjBridgeTestResource >> init';
		lf .
	self description: 'I manage a bridge dedicated to testing a PharoJS app'.
	self name: 'PharoJS Bridge TestResource'.
]

{ #category : 'running' }
PjBridgeTestResource >> isClientBrowserOpenedInBackground [
	^self class isClientBrowserOpenedInBackground
]

{ #category : 'running' }
PjBridgeTestResource >> resetClient [

	| previousProcesses |
	previousProcesses := self bridge server childProcesses copy.
	self bridge resetClient.
	previousProcesses do: #terminate.
	Smalltalk garbageCollect "Free system semaphores"
]

{ #category : 'running' }
PjBridgeTestResource >> setUpClient [
	super initialize.
		Stdio stdout
		nextPutAll: 'PjBridgeTestResource >> setUpClient';
		lf .
	^self bridge client openBrowserInBackground: self isClientBrowserOpenedInBackground
]

{ #category : 'running' }
PjBridgeTestResource >> startBridge: aBridge [

	"Avoid bridge resource process being killed by test runner.
	So, we force DefaultExecutionEnvironment  instead of the implicit TestExecutionEnvironment "
	Stdio stdout
		nextPutAll: 'PjBridgeTestResource >> startBridge';
		lf .
	DefaultExecutionEnvironment beActiveDuring: [ 
		aBridge startWithoutWaitingForClient ]
]

{ #category : 'running' }
PjBridgeTestResource >> startJsInterpreter [
	super initialize.
		Stdio stdout
		nextPutAll: 'PjBridgeTestResource >> startJsInterpreter';
		lf .
	self bridge startJsInterpreter
	
]

{ #category : 'running' }
PjBridgeTestResource >> tearDown [
	super tearDown.
	self bridge
		ifNotNil: [ self bridge tearDown.
			PjBridge soleBridge: nil ].
	Smalltalk garbageCollect
]
