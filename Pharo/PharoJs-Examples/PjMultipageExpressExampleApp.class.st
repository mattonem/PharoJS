Class {
	#name : #PjMultipageExpressExampleApp,
	#superclass : #PjExpressApp,
	#category : #'PharoJs-Examples-ExpressJS'
}

{ #category : #accessing }
PjMultipageExpressExampleApp class >> clientAppClasses [
	^ PjMultipageExpressClientExampleApp subclasses
]

{ #category : #accessing }
PjMultipageExpressExampleApp class >> publicStaticFilesFolderName [

	^ 'pages'
]
