Trait {
	#name : 'PjTWebClientApp',
	#traits : 'PjTWebClient',
	#classTraits : 'PjTWebClient classTrait',
	#category : 'PharoJs-Base-App',
	#package : 'PharoJs-Base-App'
}

{ #category : 'accessing' }
PjTWebClientApp classSide >> bridgeClientClass [

	<pharoJsSkip>
	^ PjLocalWebServedBridgeClient
]

{ #category : 'exporting' }
PjTWebClientApp classSide >> defaultAppFolderName [
	"Subclasses are likely to override this method."
	"Assume by default that the HTML is located at the root of static files folder "
	<pharoJsSkip>
	^ '.'
]

{ #category : 'exporting' }
PjTWebClientApp classSide >> defaultAppFolderParent [

	<pharoJsSkip>
	^ self serverAppClass appFolder
	  / self serverAppClass publicStaticFilesFolderName
]

{ #category : 'exporting' }
PjTWebClientApp classSide >> serverAppClass [

	<pharoJsSkip>
	^ self explicitRequirement 
]
