"
1. Class: OpenAISDKChatSession

I represent a class that handles chat sessions using the OpenAI API.

2. Responsibilities:
- I can initiate a chat session with the OpenAI API.
- I can send messages to the chat session and receive responses.
- I know how to handle errors and exceptions that may occur during the chat session.

3. Collaborators:
- OpenAI API: I interact with the OpenAI API to initiate and manage the chat session.
- User: I interact with the user by receiving their messages and sending responses.

4. Example:
OpenAISDKChatSession initiateChatSession. ""Initiates a chat session with the OpenAI API""


[This comment was created with https://github.com/brackendev/Pharo-OpenAI]
"
Class {
	#name : #OpenAISDKChatSession,
	#superclass : #Object,
	#instVars : [
		'chats'
	],
	#category : #'OpenAI-Model'
}

{ #category : #adding }
OpenAISDKChatSession >> addChat: aChatObject [

	| oc |
	oc := self chats
		      add: aChatObject;
		      yourself.
	^ self
		  chats: oc;
		  yourself
]

{ #category : #accessing }
OpenAISDKChatSession >> chats [

	^ chats
]

{ #category : #accessing }
OpenAISDKChatSession >> chats: anObject [

	chats := anObject
]
