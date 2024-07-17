Class {
	#name : 'PjClassForDefinitionTest',
	#superclass : 'Object',
	#category : 'PharoJs-Base-Transpiler-Tests-Support',
	#package : 'PharoJs-Base-Transpiler-Tests',
	#tag : 'Support'
}

{ #category : 'accessing' }
PjClassForDefinitionTest class >> literal [
	<jsLiteralGenerator>
	^ 'abc','def'
]

{ #category : 'accessing' }
PjClassForDefinitionTest >> literal [
	<jsLiteralGenerator>
	^ 3 + 4
]
