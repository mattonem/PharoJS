Class {
	#name : 'PjAppWithFolderNameIncludesSpace',
	#superclass : 'PjFileBasedWebApp',
	#category : 'PharoJs-Base-Bridge-Tests-Support',
	#package : 'PharoJs-Base-Bridge-Tests',
	#tag : 'Support'
}

{ #category : 'exporting' }
PjAppWithFolderNameIncludesSpace class >> defaultAppFolderName [
	<pharoJsSkip>
	
	^ 'Folder Name With Space'
]
