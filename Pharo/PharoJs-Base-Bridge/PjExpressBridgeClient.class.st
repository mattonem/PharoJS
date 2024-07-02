Class {
	#name : 'PjExpressBridgeClient',
	#superclass : 'PjNodeBridgeClient',
	#category : 'PharoJs-Base-Bridge-Client-Kernel',
	#package : 'PharoJs-Base-Bridge',
	#tag : 'Client-Kernel'
}

{ #category : 'initialization' }
PjExpressBridgeClient >> reset [

	self appClass noClientExportDuring: [
		super reset ]
]
