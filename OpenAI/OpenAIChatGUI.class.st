"
Class: OpenAIChatGUI

I represent a graphical user interface for interacting with OpenAI chat sessions.

Responsibilities:
- I create and manage a chat session using the provided OpenAI SDK.
- I display the chat session and handle user input.
- I manage the focus of the input field for seamless user interaction.

Collaborators:
- OpenAIChatSession: I start a chat session with the provided OpenAI SDK and manage its state.
- OpenAISDK: I use the provided SDK to interact with the OpenAI API.

Example:
- ""Open an OpenAIChatGUI with a given OpenAI SDK"": `OpenAIChatGUI openWithSDK: anOpenAISDK`


[This comment was automatically created with https://github.com/brackendev/OpenAI-Pharo]
"
Class {
	#name : #OpenAIChatGUI,
	#superclass : #SpPresenter,
	#instVars : [
		'fieldInput',
		'fieldOutput',
		'chatSession',
		'barResponse',
		'barSubmit',
		'temperatureInput',
		'fieldModel'
	],
	#category : #'OpenAI-GUI'
}

{ #category : #specs }
OpenAIChatGUI class >> openWithSDK: anOpenAISDK [

	| gui |
	gui := self new chatSession:
		       (OpenAIChatSession startWithSDK: anOpenAISDK).
	gui open.
	gui fieldInput takeKeyboardFocus
]

{ #category : #'action handling' }
OpenAIChatGUI >> actionEvaluate [

	self chatSession chats
		ifEmpty: [ self inform: 'Submit a prompt first' ]
		ifNotEmpty: [ 
			fieldOutput selectedText
				ifEmpty: [ self chatSession lastChat evaluate inspect ]
				ifNotEmpty: [ 
				(Smalltalk compiler evaluate: fieldOutput selectedText) inspect ]
			]
]

{ #category : #'action handling' }
OpenAIChatGUI >> actionExport [

	self chatSession chats
		ifEmpty: [ self inform: 'Submit a prompt first' ]
		ifNotEmpty: [ 
			| s j |
			s := self chatSession chats collect: [ :e | e toDictionary ].

			j := NeoJSONWriter toString: s.
			j outputTextFile: UUID new asString , '.json'.

			self inform: 'Chat exported to filesystem'
			]
]

{ #category : #'action handling' }
OpenAIChatGUI >> actionHelp [

	self displayResponse:
		'Additional commands:' , String crlf , String crlf
		, '/inspectsession - Inspect the session' , String crlf
		, '/listmodels - List all available models' , String crlf
		, '/system [prompt] - Set system prompt'
]

{ #category : #'action handling' }
OpenAIChatGUI >> actionImage: aSizeString prompt: aPromptString [

	UIManager default showWaitCursorWhile: [ 
		| text response url |
		text := aPromptString trimBoth.
		text ifEmpty: [ ^ nil ].


		response := self chatSession sdk
			            createImageWithPrompt: text
			            number: 1
			            size: aSizeString.

		url := response urls first.

		^ ImageReadWriter formFromStream:
			  (ZnEasy get: url) contents readStream
		]
]

{ #category : #'action handling' }
OpenAIChatGUI >> actionInspect [

self chatSession chats
		ifEmpty: [ self inform: 'Submit a prompt first' ]
		ifNotEmpty: [ 
	fieldOutput selectedText
		ifEmpty: [ self chatSession lastChat content inspect ]
		ifNotEmpty: [ fieldOutput selectedText inspect ].
			]
]

{ #category : #'action handling' }
OpenAIChatGUI >> actionSubmit [

	fieldInput text
		ifEmpty: [ self inform: 'Input a prompt first' ]
		ifNotEmpty: [ self handleInput: fieldInput text ]
]

{ #category : #accessing }
OpenAIChatGUI >> barResponse [

	^ barResponse
]

{ #category : #accessing }
OpenAIChatGUI >> barResponse: anObject [

	barResponse := anObject
]

{ #category : #accessing }
OpenAIChatGUI >> barSubmit [

	^ barSubmit
]

{ #category : #accessing }
OpenAIChatGUI >> barSubmit: anObject [

	barSubmit := anObject
]

{ #category : #accessing }
OpenAIChatGUI >> chatSession [

	^ chatSession
]

{ #category : #accessing }
OpenAIChatGUI >> chatSession: anObject [

	chatSession := anObject
]

{ #category : #private }
OpenAIChatGUI >> commandSystem: aString [

	| t |
	t := aString copyReplaceAll: '/system ' with: ''.
	
	self chatSession submitSystemPrompt: t.
	self displaySystemResponse: t.
	self displayAssistantResponse: self chatSession lastChat content.
	
	fieldInput text: ''.
	
	^ nil
]

{ #category : #private }
OpenAIChatGUI >> createImage: aSizeString [

	self chatSession chats
		ifEmpty: [ self inform: 'Input a prompt first' ]
		ifNotEmpty: [ 
			fieldOutput selectedText
				ifEmpty: [ 
					(self actionImage: aSizeString prompt: self chatSession lastChat content) inspect
					]
				ifNotEmpty: [ 
					(self actionImage: aSizeString prompt: fieldOutput selectedText) inspect
					]
			]
]

{ #category : #layout }
OpenAIChatGUI >> defaultLayout [

	<spec: #default>
	| submitRow settings |
	settings := SpBoxLayout newLeftToRight
		            spacing: 5;
		            add: (self newLabel label: 'Model:')
		            withConstraints: [ :constraints | 
			            constraints expand: false ];
		            add: #fieldModel withConstraints: [ :constraints | 
			            constraints height: 25.
			            constraints width: 150
			            ];
		            add: (self newLabel label: 'Temp:')
		            withConstraints: [ :constraints | 
			            constraints expand: false ];
		            add: #temperatureInput
		            withConstraints: [ :constraints | constraints width: 60 ];
		            yourself.

	submitRow := SpBoxLayout newLeftToRight
		             spacing: 5;
		             add: settings;
		             add: (self newButton
				              label: 'Submit';
				              icon: (self iconNamed: #glamorousGo);
				              help: 'Submit prompt to OpenAI';
				              action: [ self actionSubmit ];
				              yourself)
		             withConstraints: [ :constraints | 
			             constraints height: 27.
			             constraints width: 70
			             ];
		             yourself.

	^ SpBoxLayout newTopToBottom
		  add: #fieldOutput;
		  spacing: 5;
		  add: #barResponse expand: false;
		  add: #fieldInput
		  withConstraints: [ :constraints | constraints height: 80 ];
		  add: submitRow withConstraints: [ :constraints | 
			  constraints expand: true.
			  constraints height: 27
			  ];
		  yourself
]

{ #category : #private }
OpenAIChatGUI >> displayAssistantResponse: aString [

	self displayResponse: 'ASSISTANT: ' , aString.
]

{ #category : #private }
OpenAIChatGUI >> displayResponse: aString [

	fieldOutput
		insert: aString , String crlf , String crlf
		at: fieldOutput text size.
		
	self scrollToEndOfText
]

{ #category : #private }
OpenAIChatGUI >> displaySystemResponse: aString [

	self displayResponse: 'SYSTEM: ' , aString
]

{ #category : #private }
OpenAIChatGUI >> displayUserResponse: aString [

	self displayResponse: 'YOU: ' , aString
]

{ #category : #accessing }
OpenAIChatGUI >> fieldInput [

	^ fieldInput
]

{ #category : #accessing }
OpenAIChatGUI >> fieldInput: anObject [

	fieldInput := anObject
]

{ #category : #accessing }
OpenAIChatGUI >> fieldModel [

	^ fieldModel
]

{ #category : #accessing }
OpenAIChatGUI >> fieldModel: anObject [

	fieldModel := anObject
]

{ #category : #accessing }
OpenAIChatGUI >> fieldOutput [

	^ fieldOutput
]

{ #category : #accessing }
OpenAIChatGUI >> fieldOutput: anObject [

	fieldOutput := anObject
]

{ #category : #private }
OpenAIChatGUI >> handleInput: aString [

	UIManager default showWaitCursorWhile: [ 
		| text |
		text := aString trimBoth.
		text ifEmpty: [ ^ nil ].
				text = '/inspectsession' ifTrue: [ 
			self chatSession inspect.
			fieldInput text: ''.
			^ nil
			].
		text = '/listmodels' ifTrue: [ 
			self chatSession sdk listModels inspect.
			fieldInput text: ''.
			^ nil
			].
		(text beginsWith: '/system ') ifTrue: [ ^ self commandSystem: text ].

		self chatSession model: fieldModel text.
		self chatSession temperature: temperatureInput number.
		self chatSession submitUserPrompt: aString.

		self displayUserResponse: aString.
		self displayAssistantResponse: self chatSession lastChat content.

		fieldInput text: ''.

		^ nil
		]
]

{ #category : #initialization }
OpenAIChatGUI >> initializePresenters [

	fieldOutput := self newText
		               beNotEditable;
		               enabled: false.

	fieldInput := self newText.
	fieldInput
		beWrapWord;
		editable: true;
		placeholder: 'Your prompt'.

	fieldModel := self newTextInput.
	fieldModel
		editable: true;
		text: 'gpt-3.5-turbo'.

	temperatureInput := self newNumberInput
		                    beFloat;
		                    digits: 2;
		                    climbRate: 0.01;
		                    minimum: 0;
		                    maximum: 2;
		                    number: 0.00.

	barResponse := self newActionBar
		               add: (self newButton
				                label: 'Evaluate';
				                icon: (self iconNamed: #glamorousGo);
				                help:
					                'Evaluate the last response (or the selected text) and inspect';
				                action: [ self actionEvaluate ];
				                yourself);
		               add: (self newButton
				                label: 'Image';
				                icon: (self iconNamed: #glamorousSpawn);
				                help:
					                'Generate an image from the last response (or the selected text) and inspect';
				                contextMenu: self menuImage;
				                yourself);
						               add: (self newButton
				                label: 'Inspect';
				                icon: (self iconNamed: #glamorousInspect);
				                help:
					                'Inspect the last response (or the selected text)';
				                action: [ self actionInspect ];
				                yourself);
		               add: (self newButton
				                label: 'Export';
				                icon: (self iconNamed: #glamorousSaveToUrl);
				                help: 'Export to filesystem';
				                action: [ self actionExport ];
				                yourself);
		               add: (self newButton
				                label: 'Clear';
				                icon: (self iconNamed: #glamorousCancel);
				                help: 'Clear the session';
				                action: [ 
					                self chatSession chats: OrderedCollection new.
					                fieldOutput text: ''
					                ];
				                yourself);
		               "add: (self newButton
				                label: 'Clear';
				                icon: (self iconNamed: #glamorousCancel);
				                help: 'Clear the last prompt or session';
				                contextMenu: self menuClear;
				                yourself);"
		               addLast: (self newButton
				                label: 'Help';
				                icon: (self iconNamed: #glamorousHelp);
				                help: 'Show help text';
				                action: [ self actionHelp ];
				                yourself);
		               yourself.

	barSubmit := self newActionBar addLast: (self newButton
			              label: 'Submit';
			              icon: (self iconNamed: #glamorousGo);
			              help: 'Submit prompt to OpenAI';
			              action: [ self actionSubmit ];
			              yourself).

	self focusOrder add: fieldInput
]

{ #category : #initialization }
OpenAIChatGUI >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		aboutText: 'https://github.com/brackendev/OpenAI-Pharo';
		initialExtent: 500 @ 500;
		title: 'OpenAI Chat'
]

{ #category : #specs }
OpenAIChatGUI >> layout [

	^ self defaultLayout
]

{ #category : #gui }
OpenAIChatGUI >> menuClear [

	"TODO"

	^ self newMenu
		  addItem: [ :item | 
			  item
				  name: 'Last Prompt';
				  action: [ "TODO"]
			  ];
		  addItem: [ :item | 
			  item
				  name: 'Session';
				  action: [ 
					  self chatSession chats: OrderedCollection new.

					  fieldOutput text: ''
					  ]
			  ];
		  yourself
]

{ #category : #gui }
OpenAIChatGUI >> menuImage [

	^ self newMenu
		  addItem: [ :item | 
			  item
				  name: '256x256';
				  action: [ self createImage: '256x256' ]
			  ];
		  addItem: [ :item | 
			  item
				  name: '512x512';
				  action: [ self createImage: '512x512' ]
			  ];
		  addItem: [ :item | 
			  item
				  name: '1024x1024';
				  action: [ self createImage: '1024x1024' ]
			  ];
		  yourself
]

{ #category : #'scrollbar managing' }
OpenAIChatGUI >> scrollToEndOfText [

	fieldOutput adapter widget scrollToEndOfText
]

{ #category : #accessing }
OpenAIChatGUI >> temperatureInput [

	^ temperatureInput
]

{ #category : #accessing }
OpenAIChatGUI >> temperatureInput: anObject [

	temperatureInput := anObject
]
