Class {
	#name : 'PjLoggingClientBridgeAppClassDecorator',
	#superclass : 'PjBridgeAppClassDecorator',
	#category : 'PharoJs-Base-Bridge-Client-CodeGenerator',
	#package : 'PharoJs-Base-Bridge',
	#tag : 'Client-CodeGenerator'
}

{ #category : 'accessing' }
PjLoggingClientBridgeAppClassDecorator class >> websocketDelegateClass [

	^ PjLoggingEvaluatorWebsocketDelegate
]
