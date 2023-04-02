"
Class: OpenAIImageGUI

I represent a class that creates a GUI interface for an OpenAI image.

Responsibilities:
- Create a new GUI interface with the provided OpenAISDK and image size properties.
- Display the GUI interface.
- Take keyboard focus for the text field within the GUI.

Collaborators:
- OpenAISDK: Provides the necessary image content for the GUI.
- textField: The text field within the GUI that takes keyboard focus.

Example:
OpenAIImageGUI openWithSDK: myOpenAISDK imageSize: '512x512'.
""Creates a GUI with image content provided by myOpenAISDK and an image size of 512x512.""


[This comment was created with https://github.com/brackendev/Pharo-OpenAI]
"
Class {
	#name : #OpenAIImageGUI,
	#superclass : #SpPresenter,
	#instVars : [
		'sdk',
		'textField',
		'imageContainer',
		'imageSize',
		'textLabel'
	],
	#category : #'OpenAI-GUI'
}

{ #category : #specs }
OpenAIImageGUI class >> openWithSDK: anOpenAISDK [

	| gui |
	gui := self new sdk: anOpenAISDK; imageSize: '256x256'.
	gui open.
	gui textField takeKeyboardFocus
]

{ #category : #specs }
OpenAIImageGUI class >> openWithSDK: anOpenAISDK imageSize: aSizeString [

	| gui |
	gui := self new sdk: anOpenAISDK; imageSize: aSizeString.
	gui open.
	gui textField takeKeyboardFocus
]

{ #category : #loading }
OpenAIImageGUI >> defaultLayout [

	^ SpBoxLayout newTopToBottom
			  add: textLabel expand: false;
		  add: imageContainer expand: true;
		  add: textField expand: false;
		  yourself
]

{ #category : #private }
OpenAIImageGUI >> handleInput: aString [

	UIManager default showWaitCursorWhile: [ 
		| text response url image |
		text := aString trimBoth.
		text ifEmpty: [ ^ nil ].
		text = '/export' ifTrue: [ 
			imageContainer image asMorph outputPNGFile: UUID new asString.
			textField text: ''.
			^ nil
			].
		(text beginsWith: '/imagesize ') ifTrue: [ 
			| t |
			t := text copyReplaceAll: '/imagesize ' with: ''.
			self imageSize: t.
			textField text: ''.
			^ nil
			].


		response := sdk
			            createImageWithPrompt: text
			            number: 1
			            size: imageSize.
		url := response urls first.
		image := ImageReadWriter formFromStream:
			         (ZnEasy get: url) contents readStream.
		imageContainer image: image.

		textLabel label: text.
		textField text: ''
		]
]

{ #category : #accessing }
OpenAIImageGUI >> imageContainer [

	^ imageContainer
]

{ #category : #accessing }
OpenAIImageGUI >> imageContainer: anObject [

	imageContainer := anObject
]

{ #category : #accessing }
OpenAIImageGUI >> imageSize [

	^ imageSize
]

{ #category : #accessing }
OpenAIImageGUI >> imageSize: anObject [

	imageSize := anObject
]

{ #category : #loading }
OpenAIImageGUI >> initialize [

	super initialize.
	self initializeWidgets.
]

{ #category : #initialization }
OpenAIImageGUI >> initializePresenters [

	textLabel := self newTextLabel.
	imageContainer := self newImageContainer.
	textField := self newTextInput
		             whenSubmitDo: [ :text | self handleInput: text ];
		             placeholder: 'Describe an image'
]

{ #category : #loading }
OpenAIImageGUI >> initializeWidgets [

	self initializePresenters.
]

{ #category : #initialization }
OpenAIImageGUI >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		aboutText: 'https://github.com/brackendev/Pharo-OpenAI';
		initialExtent: 400 @ 400;
		title: 'OpenAI Image Generator'
]

{ #category : #loading }
OpenAIImageGUI >> layout [

	^ self defaultLayout
]

{ #category : #initialization }
OpenAIImageGUI >> loadImageFromURL [

	| url response image |
	url := textField text.
response := ZnClient new
				            url: url;
				            get;
				            response.
			response isSuccess
				ifTrue: [ 
					image := ImageReadWriter formFromStream:
						         response contents readStream.
					imageContainer image: image
					]
				ifFalse: [ 
					self inform:
						'Failed to load image. Please check the URL and try again.'
					]
]

{ #category : #initialization }
OpenAIImageGUI >> newImageContainer [
	^ SpImagePresenter new
		extent: 800@600;
		yourself
]

{ #category : #initialization }
OpenAIImageGUI >> newTextField [ 
	^ SpTextInputFieldPresenter new
		yourself
]

{ #category : #initialization }
OpenAIImageGUI >> newTextLabel [

	^ SpLabelPresenter new yourself
]

{ #category : #accessing }
OpenAIImageGUI >> sdk [

	^ sdk
]

{ #category : #accessing }
OpenAIImageGUI >> sdk: anObject [

	sdk := anObject
]

{ #category : #gui }
OpenAIImageGUI >> showMessageDialog: aString [
| presenter |
	presenter := SpTextPresenter new
		             text: aString;
		beNotEditable;
		             open.

	presenter withWindowDo: [ :w | 
		w
			title: 'OpenAI Image Generator'
		]
]

{ #category : #accessing }
OpenAIImageGUI >> textField [

	^ textField
]

{ #category : #accessing }
OpenAIImageGUI >> textField: anObject [

	textField := anObject
]

{ #category : #accessing }
OpenAIImageGUI >> textLabel [

	^ textLabel
]

{ #category : #accessing }
OpenAIImageGUI >> textLabel: anObject [

	textLabel := anObject
]
