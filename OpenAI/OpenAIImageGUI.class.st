"
Class: OpenAIImageGUI

I represent a graphical user interface for interacting with OpenAI image generation.

Responsibilities:
- I create and manage a user interface for OpenAI image generation.
- I handle user input and communicate with the OpenAI SDK.
- I display generated images based on user input and SDK responses.

Collaborators:
- OpenAISDK: I interact with the OpenAI SDK to generate images based on user input.
- TextField: I use a text field to capture user input for image generation.

Example:
- ""Open an OpenAIImageGUI with a given OpenAISDK instance: `OpenAIImageGUI openWithSDK: anOpenAISDK`""


[This comment was automatically created with https://github.com/brackendev/OpenAI-Pharo]
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
	gui := self new
		       sdk: anOpenAISDK;
		       imageSize: '256x256'.
	gui open.
	gui textField takeKeyboardFocus
]

{ #category : #'action handling' }
OpenAIImageGUI >> actionExport [

	imageContainer image
		ifNil: [ self inform: 'Submit a prompt first' ]
		ifNotNil: [ 
			| f |
			f := UUID new asString.

			imageContainer image asMorph outputPNGFile: f.

			textLabel label ifNotEmpty: [ 
				textLabel label outputTextFile: f , '.txt' ].

			self inform: 'Image exported to filesystem'
			]
]

{ #category : #'action handling' }
OpenAIImageGUI >> actionInspect [

	imageContainer image
		ifNil: [ self inform: 'Submit a prompt first' ]
		ifNotNil: [ imageContainer image inspect ]
]

{ #category : #'action handling' }
OpenAIImageGUI >> actionSubmit [

	textField text
		ifEmpty: [ self inform: 'Input a prompt first' ]
		ifNotEmpty: [ self handleInput: textField text ]
]

{ #category : #layout }
OpenAIImageGUI >> defaultLayout [

	<spec: #default>
	| barResponse barSubmit |
	barResponse := self newActionBar
		               add: (self newButton
				                label: 'Export';
				                icon: (self iconNamed: #glamorousSaveToUrl);
				                help: 'Export to filesystem';
				                action: [ self actionExport ];
				                yourself);
		               add: (self newButton
				                label: 'Inspect';
				                icon: (self iconNamed: #glamorousInspect);
				                help: 'Inspect image';
				                action: [ self actionInspect ];
				                yourself);
		               add: (self newButton
				                label: 'Inspect';
				                label: 'Clear';
				                icon: (self iconNamed: #glamorousCancel);
				                help: 'Clear the image';
				                action: [ 
					                imageContainer image: (Form extent: 0 @ 0).
					                textField text: ''.
					                textLabel label: ''
					                ];
				                yourself);
		               yourself.

	barSubmit := self newActionBar
		             addLast: (self newButton
				              label: 'Size';
				              icon: (self iconNamed: #smallConfiguration);
				              help: 'Image size';
				              contextMenu: self menuImageSize;
				              yourself);
		             addLast: (self newButton
				              label: 'Submit';
				              icon: (self iconNamed: #glamorousGo);
				              help: 'Submit prompt to OpenAI';
				              action: [ self actionSubmit ];
				              yourself).

	^ SpBoxLayout newTopToBottom
		  add: imageContainer expand: true;
		  add: textLabel expand: false;
		  add: barResponse expand: false;
		  add: textField withConstraints: [ :constraints | 
			  constraints height: 80.
			  constraints padding: 5
			  ];
		  addLast: barSubmit expand: false;
		  yourself
]

{ #category : #private }
OpenAIImageGUI >> handleInput: aString [

[ 
	UIManager default showWaitCursorWhile: [
		| text response url |
		text := aString trimBoth.
		text ifEmpty: [ ^ nil ].


		response := sdk
			            createImageWithPrompt: text
			            number: 1
			            size: imageSize.

		url := response urls first.

		imageContainer image: url imageFromURL.

		textLabel label: text.

		textField text: ''
		]
		]
		on: Exception
		do: [ :error | error inspect ]
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
	imageContainer image: (Form extent: 0 @ 0).

	textField := self newText.
	textField
		beWrapWord;
		editable: true;
		placeholder: 'Your prompt'.

	self focusOrder add: textField
]

{ #category : #loading }
OpenAIImageGUI >> initializeWidgets [

	self initializePresenters.
]

{ #category : #initialization }
OpenAIImageGUI >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		aboutText: 'https://github.com/brackendev/OpenAI-Pharo';
		initialExtent: 400 @ 500;
		title: 'OpenAI Image Creator'
]

{ #category : #accessing }
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

{ #category : #gui }
OpenAIImageGUI >> menuImageSize [

	^ self newMenu
		  addItem: [ :item | 
			  item
				  name: '256x256';
				  action: [ self imageSize: '256x256' ]
			  ];
		  addItem: [ :item | 
			  item
				  name: '512x512';
				  action: [ self imageSize: '512x512' ]
			  ];
		  addItem: [ :item | 
			  item
				  name: '1024x1024';
				  action: [ self imageSize: '1024x1024' ]
			  ];
		  yourself
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
