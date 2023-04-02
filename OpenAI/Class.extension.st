Extension { #name : #Class }

{ #category : #'*OpenAI' }
Class >> classResponsibilityCollaboratorWithSDK: anOpenAISDK [

	| chat |
	chat := OpenAIChat startWithSDK: anOpenAISDK.
	chat submitUserPrompt:
		'In plain text, describe the following Pharo Smalltalk class using the following template inspired by Class Responsibility Collaborator (CRC) design:'
		, String crlf , String crlf , String crlf
		,
		'1. For the Class part: State a one line summary. For example: Class: ClassName\n\nI represent a paragraph of text.'
		, String crlf , String crlf , 'Class: ClassName' , String crlf
		, String crlf , 'I represent a class that does something.'
		, String crlf , String crlf , String crlf
		,
		'2. For the Responsibility part: State three sentences about my main responsibilities - what I do, what I know. List format.'
		, String crlf , String crlf , String crlf
		,
		'3. For the Collaborators part: State my main collaborators and one line about how I interact with them. List format.'
		, String crlf , String crlf , String crlf
		,
		'4. For the Example part: State any examples of using the class and a one line comment in double quotes.'
		, String crlf , String crlf , String crlf , 'This is the class:'
		, String crlf , String crlf , self definitionAndSourceCode.
	chat lastChat content ifEmpty: [ ^ nil ] ifNotEmpty: [ 
		^ (chat lastChat content trimLineSpaces
			   replaceAll: String crlf , String crlf
			   with: String crlf)
			  replaceAll: String cr , String cr
			  with: String crlf
		]
]

{ #category : #'*OpenAI' }
Class >> definitionAndSourceCode [

	| classSourceStream |
	classSourceStream := WriteStream on: String new.
	self class fileOutOn: classSourceStream.

	^ classSourceStream contents
]

{ #category : #'*OpenAI' }
Class >> updateCommentWithOpenAICRCWithSDK: anOpenAISDK [

	| crc |
	crc := self classResponsibilityCollaboratorWithSDK: anOpenAISDK.
	crc ifNotNil: [ 
		self class comment: crc , String crlf , String crlf , String crlf
			,
			'[This comment was automatically created with https://github.com/brackendev/OpenAI-Pharo]'
		]
]
