Class {
	#name : 'PjMessageErrorResponse',
	#superclass : 'PjMessageC2sInResponseTo',
	#category : 'PharoJs-Base-Bridge-Messages',
	#package : 'PharoJs-Base-Bridge',
	#tag : 'Messages'
}

{ #category : 'accessing' }
PjMessageErrorResponse >> getValueWithBridge: aBridge [

	PjJavascriptError signal: self contents
]
