Class {
	#name : 'PJWebBrowser',
	#superclass : 'Object',
	#classInstVars : [
		'chromePath'
	],
	#category : 'PharoJs-Base-Bridge-Client-Kernel',
	#package : 'PharoJs-Base-Bridge',
	#tag : 'Client-Kernel'
}

{ #category : 'as yet unclassified' }
PJWebBrowser class >> initChrome [

	LibC resultOfCommand: 'npm init -y'.
	LibC resultOfCommand: 'npm i @puppeteer/browsers'.
	LibC resultOfCommand: 'npm install @puppeteer/browsers'.
	chromePath := (' (.*)\n' asRegex matchesIn:
		               (LibC resultOfCommand:
			                'npx @puppeteer/browsers install chrome@stable'))
		              first allButLast allButFirst.
	Stdio stdout
		nextPutAll: 'chrome path set: ';
		nextPutAll: chromePath;
		lf
]

{ #category : 'as yet unclassified' }
PJWebBrowser class >> openOn: urlString inBackground: aBoolean [

	chromePath ifNil: [ self initChrome ].
	Stdio stdout
		nextPutAll: 'command to be ran: ';
		nextPutAll: '"' , chromePath , '" --headless ' , urlString , '&';
		lf.
	LibC system: '"' , chromePath , '" --headless ' , urlString , '&'
]
