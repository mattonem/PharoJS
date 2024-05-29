"
I am a minimal implementation of Stack
"
Class {
	#name : 'PjStack',
	#superclass : 'PjArray',
	#type : 'variable',
	#category : 'PharoJs-Base-JS-CoreLibraries-Kernel',
	#package : 'PharoJs-Base-JS-CoreLibraries',
	#tag : 'Kernel'
}

{ #category : 'pharoJs support' }
PjStack class >> jsTranspilationImportMethods [
	<pharoJsSkip>
	^{Stack -> #(top pop push:)}
]
