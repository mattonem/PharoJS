Class {
	#name : 'PjMessageReload',
	#superclass : 'PjMessageS2c',
	#category : 'PharoJs-Base-Bridge-Messages',
	#package : 'PharoJs-Base-Bridge',
	#tag : 'Messages'
}

{ #category : 'public' }
PjMessageReload >> evaluateInContext: aMessageContext [

	aMessageContext websocketDelegate class reload
]
