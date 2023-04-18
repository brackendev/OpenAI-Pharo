"
Class: OpenAISDKChatCompletionChoices

I represent a class that manages chat completion choices from OpenAI API responses.

Responsibilities:
- I create instances of myself using API responses.
- I store the index, message, and finish reason of a chat completion choice.
- I provide access to the chat completion choice information.

Collaborators:
- OpenAISDKChat: I create instances of OpenAISDKChat using the role and content from the API response.

Example:
- ""Create an OpenAISDKChatCompletionChoices instance from an API response: `OpenAISDKChatCompletionChoices createWithAPIResponse: aResponse`""


[This comment was automatically created with https://github.com/brackendev/OpenAI-Pharo]
"
Class {
	#name : #OpenAISDKChatCompletionChoices,
	#superclass : #Object,
	#instVars : [
		'index',
		'message',
		'finishReason'
	],
	#category : #'OpenAI-Model'
}

{ #category : #'instance creation' }
OpenAISDKChatCompletionChoices class >> createWithAPIResponse: aResponse [

	| message |
	message := aResponse at: 'message'.
	^ self new
		  index: (aResponse at: 'index');
		  message: (OpenAISDKChat
				   createWithRole: (message at: 'role')
				   content: (message at: 'content'));
		  finishReason: (aResponse at: 'finish_reason')
]

{ #category : #accessing }
OpenAISDKChatCompletionChoices >> finishReason [

	^ finishReason
]

{ #category : #accessing }
OpenAISDKChatCompletionChoices >> finishReason: anObject [

	finishReason := anObject
]

{ #category : #accessing }
OpenAISDKChatCompletionChoices >> index [

	^ index
]

{ #category : #accessing }
OpenAISDKChatCompletionChoices >> index: anObject [

	index := anObject
]

{ #category : #accessing }
OpenAISDKChatCompletionChoices >> message [

	^ message
]

{ #category : #accessing }
OpenAISDKChatCompletionChoices >> message: anObject [

	message := anObject
]
