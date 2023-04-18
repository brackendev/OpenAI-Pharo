"
Class: OpenAISDKChat

I represent a chat message in the OpenAI SDK.

Responsibilities:
- I store the role of the sender (e.g., user or assistant).
- I store the content of the chat message.
- I can create a new instance of myself with a given role and content.

Collaborators:
- OpenAISDKChat instances: I interact with other instances of myself to represent a conversation.

Example:
- chatMessage := OpenAISDKChat createWithRole: 'user' content: 'Hello, how are you?'
  ""Create a new chat message with the role 'user' and content 'Hello, how are you?'""


[This comment was automatically created with https://github.com/brackendev/OpenAI-Pharo]
"
Class {
	#name : #OpenAISDKChat,
	#superclass : #Object,
	#instVars : [
		'role',
		'content'
	],
	#category : #'OpenAI-Model'
}

{ #category : #'instance creation' }
OpenAISDKChat class >> createWithRole: aRoleString content: aContentString [

	^ self new
		  role: aRoleString;
		  content: aContentString
]

{ #category : #accessing }
OpenAISDKChat >> content [

	^ content
]

{ #category : #accessing }
OpenAISDKChat >> content: anObject [

	content := anObject
]

{ #category : #'public access' }
OpenAISDKChat >> evaluate [

	[ ^ Smalltalk compiler evaluate: content ]
		on: Exception
		do: [ :error | error inspect ]
]

{ #category : #accessing }
OpenAISDKChat >> role [

	^ role
]

{ #category : #accessing }
OpenAISDKChat >> role: anObject [

	role := anObject
]

{ #category : #serialization }
OpenAISDKChat >> toDictionary [

	^ {  ('role' -> role).
		  ('content' -> content) } asDictionary
]
