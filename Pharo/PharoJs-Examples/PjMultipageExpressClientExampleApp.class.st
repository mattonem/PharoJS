Class {
	#name : 'PjMultipageExpressClientExampleApp',
	#superclass : 'PjWebApplication',
	#traits : 'PjTWebClientApp',
	#classTraits : 'PjTWebClientApp classTrait',
	#category : 'PharoJs-Examples-ExpressJS',
	#package : 'PharoJs-Examples',
	#tag : 'ExpressJS'
}

{ #category : 'exporting' }
PjMultipageExpressClientExampleApp class >> serverAppClass [

	<pharoJsSkip>
	^ PjMultipageExpressExampleApp 
]
