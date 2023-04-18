"
Class: OpenAISDKChatCompletion

I represent a chat completion object in the OpenAI SDK.

Responsibilities:
- I store the ID of the chat completion.
- I store the object type, creation time, and model information of the chat completion.
- I store the choices and usage information of the chat completion.

Collaborators:
- OpenAISDKChatCompletionChoices: I create instances of this class using the API response data.

Example:
- ""Create a new OpenAISDKChatCompletion instance with the API response data.""


[This comment was automatically created with https://github.com/brackendev/OpenAI-Pharo]
"
Class {
	#name : #OpenAISDKChatCompletion,
	#superclass : #Object,
	#instVars : [
		'id',
		'object',
		'created',
		'model',
		'choices',
		'usage'
	],
	#category : #'OpenAI-Model'
}

{ #category : #'instance creation' }
OpenAISDKChatCompletion class >> createWithAPIResponse: aResponse [

	^ self new
		  id: (aResponse at: 'id');
		  object: (aResponse at: 'object');
		  created: (aResponse at: 'created');
		  model: (aResponse at: 'model');
		  choices: ((aResponse at: 'choices') collect: [ :e | 
					   OpenAISDKChatCompletionChoices createWithAPIResponse: e ]);
		  usage: (aResponse at: 'usage')
]

{ #category : #accessing }
OpenAISDKChatCompletion >> choices [

	^ choices
]

{ #category : #accessing }
OpenAISDKChatCompletion >> choices: anObject [

	choices := anObject
]

{ #category : #accessing }
OpenAISDKChatCompletion >> created [

	^ created
]

{ #category : #accessing }
OpenAISDKChatCompletion >> created: anObject [

	created := anObject
]

{ #category : #accessing }
OpenAISDKChatCompletion >> firstChoice [
^ (choices at: 1) message content
]

{ #category : #accessing }
OpenAISDKChatCompletion >> id [

	^ id
]

{ #category : #accessing }
OpenAISDKChatCompletion >> id: anObject [

	id := anObject
]

{ #category : #accessing }
OpenAISDKChatCompletion >> model [

	^ model
]

{ #category : #accessing }
OpenAISDKChatCompletion >> model: anObject [

	model := anObject
]

{ #category : #accessing }
OpenAISDKChatCompletion >> object [

	^ object
]

{ #category : #accessing }
OpenAISDKChatCompletion >> object: anObject [

	object := anObject
]

{ #category : #accessing }
OpenAISDKChatCompletion >> usage [

	^ usage
]

{ #category : #accessing }
OpenAISDKChatCompletion >> usage: anObject [

	usage := anObject
]
