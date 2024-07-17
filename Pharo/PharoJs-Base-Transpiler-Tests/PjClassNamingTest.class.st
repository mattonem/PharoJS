Class {
	#name : 'PjClassNamingTest',
	#superclass : 'TestCase',
	#category : 'PharoJs-Base-Transpiler-Tests-Tests',
	#package : 'PharoJs-Base-Transpiler-Tests',
	#tag : 'Tests'
}

{ #category : 'tests' }
PjClassNamingTest >> testClassNeedsCreation [
	self deny: Object needsClassDeclaration.
	self deny: BlockClosure needsClassDeclaration.
	self assert: UndefinedObject needsClassDeclaration.
]
