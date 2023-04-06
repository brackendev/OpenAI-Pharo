"
Class: OpenAIChatGUI

I represent a class that provides a Graphical User Interface (GUI) for chatting with OpenAI powered chatbots.

Responsibilities:
- Create a new GUI object for chatting with OpenAI chatbots.
- Start the chat with OpenAI SDK.
- Set the focus to the input field for typing.

Collaborators:
- OpenAIChat: The chatbot for communicating with the user.
- SpBoxLayout: A layout manager for arranging the input and output fields in the GUI.

Example:
""Create a GUI object for chatting with OpenAI chatbots and open it on the screen.""
gui := OpenAIChatGUI openWithSDK: aSDK.


[This comment was created with https://github.com/brackendev/Pharo-OpenAI]
"
Class {
	#name : #OpenAIChatGUI,
	#superclass : #SpPresenter,
	#instVars : [
		'fieldInput',
		'fieldOutput',
		'chat'
	],
	#category : #'OpenAI-GUI'
}

{ #category : #specs }
OpenAIChatGUI class >> defaultLayout [

	<spec: #default>
	^ SpBoxLayout newTopToBottom
		  add: #fieldOutput;
		  add: #fieldInput withConstraints: [ :constraints | 
			  constraints height: 25.
			  constraints padding: 5
			  ];
		  yourself
]

{ #category : #specs }
OpenAIChatGUI class >> openWithSDK: anOpenAISDK [

	| gui |
	gui := self new chat: (OpenAIChat startWithSDK: anOpenAISDK).
	gui open.
	gui fieldInput takeKeyboardFocus
]

{ #category : #accessing }
OpenAIChatGUI >> chat [

	^ chat
]

{ #category : #accessing }
OpenAIChatGUI >> chat: anObject [

	chat := anObject
]

{ #category : #adding }
OpenAIChatGUI >> displayAssistantResponse: aString [

	self displayResponse: 'ASSISTANT: ' , aString
]

{ #category : #adding }
OpenAIChatGUI >> displayResponse: aString [

	fieldOutput
		insert: aString , String crlf, String crlf
		at: fieldOutput text size 
]

{ #category : #adding }
OpenAIChatGUI >> displaySystemResponse: aString [

	self displayResponse: 'SYSTEM: ' , aString
]

{ #category : #adding }
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
		text = '/export' ifTrue: [ 
			| s j |
			s := self chat session chats collect: [ :e | e toDictionary ].
			j := NeoJSONWriter toString: s.
			j outputTextFile: UUID new asString , '.json'.
			fieldInput text: ''.
			^ nil
			].
		(text beginsWith: '/system ') ifTrue: [ 
			| t |
			t := text copyReplaceAll: '/system ' with: ''.
			self chat submitSystemPrompt: t.
			self displaySystemResponse: t.
			self displayAssistantResponse: self chat lastChat content.
			fieldInput text: ''.
			^ nil
			].
		(text beginsWith: '/inspect') ifTrue: [ 
			self chat lastChat content inspect.
			^ nil
			].
		(text beginsWith: '/evaluate') ifTrue: [ 
			(Smalltalk compiler evaluate: self chat lastChat content) inspect.
			^ nil
			].

		self chat submitUserPrompt: text.
		self displayUserResponse: text.

		self displayAssistantResponse: self chat lastChat content.

		fieldInput text: ''
		]
]

{ #category : #initialization }
OpenAIChatGUI >> initializePresenters [

	fieldOutput := self newText
		               beNotEditable;
		               enabled: false.

	fieldInput := self newTextInput
		              whenSubmitDo: [ :text | self handleInput: text ];
		              placeholder: 'Your prompt'.

	self focusOrder add: fieldInput
]

{ #category : #initialization }
OpenAIChatGUI >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		aboutText: 'https://github.com/brackendev/OpenAI-Pharo';
		initialExtent: 400 @ 400;
		title: 'OpenAI Chat'
]
