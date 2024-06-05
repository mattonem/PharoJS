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

	"Assume by default that the HTML is located at the root of static files folder 
	See PjApplication class >> #defaultAppFolderPath "

	<pharoJsSkip>
	^ nil
]

{ #category : 'exporting' }
PjTWebClientApp classSide >> defaultAppFolderParent [

	<pharoJsSkip>
	^ self serverAppClass rootPathForClientClass: self
]

{ #category : 'exporting' }
PjTWebClientApp classSide >> serverAppClass [

	<pharoJsSkip>
	^ self explicitRequirement 
]

{ #category : 'exporting' }
PjTWebClientApp classSide >> urlPathString [

	<pharoJsSkip>
	^ self appFullHtmlFileName pathString allButFirst:
		  self defaultAppFolderParent pathString size
]
