"
Class: OpenAISDKChatCompletion

I represent a class that creates a chat completion object from an API response, and extracts the necessary information from the response.

Responsibilities:
- Create a chat completion object with the necessary information from an API response.
- Extract relevant information such as ID, object, created date, model, choices, and usage from the API response.
- Generate chat completion choices by creating OpenAISDKChatCompletionChoices objects from the API response.

Collaborators:
- OpenAISDKChatCompletionChoices: create chat completion choices by calling its createWithAPIResponse method.

Example:
""Creating a chat completion object from an API response""
response := {'id': '123', 'object': 'chat', 'created': '2022-05-23', 'model': 'gpt-3', 'choices': [{'text': 'Hello', 'confidence': 0.9}, {'text': 'Hi there!', 'confidence': 0.8}], 'usage': 'Development'}.
completion := OpenAISDKChatCompletion createWithAPIResponse: response.
""completion now contains the extracted information from the API response""


[This comment was created with https://github.com/brackendev/Pharo-OpenAI]
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
