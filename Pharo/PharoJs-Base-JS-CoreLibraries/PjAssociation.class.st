"
I am the Javascript embodiment of Association.
"
Class {
	#name : 'PjAssociation',
	#superclass : 'PjLookupKey',
	#category : 'PharoJs-Base-JS-CoreLibraries-Kernel',
	#package : 'PharoJs-Base-JS-CoreLibraries',
	#tag : 'Kernel'
}

{ #category : 'pharojs support' }
PjAssociation class >> jsTranspilationImportMethods [

	<pharoJsSkip>
	^ {
		  (Association -> #( = #key:value: value value: isSelfEvaluating)).
		  (Association class -> #( #key:value: )) }
]
