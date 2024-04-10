Class {
	#name : 'PjMessageTerminate',
	#superclass : 'PjMessageS2c',
	#category : 'PharoJs-Base-Bridge-Messages',
	#package : 'PharoJs-Base-Bridge',
	#tag : 'Messages'
}

{ #category : 'public' }
PjMessageTerminate >> evaluateInContext: aMessageContext [

	aMessageContext websocketDelegate class terminate
]
