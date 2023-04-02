"
Class: OpenAIChat

I represent a class that creates chat sessions using OpenAI SDK.

Responsibilities:
- Create a new OpenAIChat session with a given SDK.
- Manage the conversations/chats within a session.
- Manage the response generation using OpenAI SDK.

Collaborators:
- AnOpenAISDK: The SDK used to generate responses for the chat conversations.

Example:
""Create a new chat session with the OpenAI SDK""
OpenAIChat startWithSDK: anOpenAISDK.


[This comment was created with https://github.com/brackendev/Pharo-OpenAI]
"
Class {
	#name : #OpenAIChat,
	#superclass : #Object,
	#instVars : [
		'sdk',
		'session'
	],
	#category : #'OpenAI-Core'
}

{ #category : #'instance creation' }
OpenAIChat class >> startWithSDK: anOpenAISDK [

	| c |
	c := self new sdk: anOpenAISDK; session: OpenAISDKChatSession new.
	c session chats: OrderedCollection new.
	^ c
]

{ #category : #accessing }
OpenAIChat >> lastChat [

	^ self session chats last
]

{ #category : #accessing }
OpenAIChat >> sdk [

	^ sdk
]

{ #category : #accessing }
OpenAIChat >> sdk: anObject [

	sdk := anObject
]

{ #category : #accessing }
OpenAIChat >> session [

	^ session
]

{ #category : #accessing }
OpenAIChat >> session: anObject [

	session := anObject
]

{ #category : #adding }
OpenAIChat >> submitPrompt: aPromptString role: aRoleString [

	| chat response assistantChat |
	chat := OpenAISDKChat
		            createWithRole: aRoleString
		            content: aPromptString.
	self session addChat: chat.
	response := sdk createChatCompletionWithMessages: self session chats.
	assistantChat := response choices first message.
	self session addChat: assistantChat
]

{ #category : #adding }
OpenAIChat >> submitSystemPrompt: aPromptString [

	self submitPrompt: aPromptString role: 'system'
]

{ #category : #adding }
OpenAIChat >> submitUserPrompt: aPromptString [

	self submitPrompt: aPromptString role: 'user'
]
