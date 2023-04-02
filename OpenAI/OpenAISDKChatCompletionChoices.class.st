"
1. Class: OpenAISDKChatCompletionChoices

I represent a class that creates a new chat completion choice with an API response.

2. Responsibilities:
- Create a new chat completion choice with an API response.
- Extract useful information from the API response such as the message, index, role, and content.
- Instantiate a new OpenAISDKChat based on the extracted information.

3. Collaborators:
- OpenAISDKChat: Collaborates to create a new chat with the extracted message and content.

4. Example:
""Create a new chat completion choice with an API response""
aResponse := {'message' -> {'role' -> 'bot', 'content' -> 'Hello, how can I help you?'}, 'index' -> 0, 'finish_reason' -> 'completed'}.
completionChoice := OpenAISDKChatCompletionChoices createWithAPIResponse: aResponse.  ""Creates a new chat completion choice based on the API response""


[This comment was created with https://github.com/brackendev/Pharo-OpenAI]
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
