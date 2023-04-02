"
Class: OpenAISDKModels

I represent a class responsible for creating OpenAI SDK models, parsing their APIs and handling their data.

Responsibilities:
- Create new OpenAI SDK models.
- Parse APIs for OpenAI SDK models.
- Handle the data for OpenAI SDK models.

Collaborators:
- OpenAISDKModel class: Used to create OpenAI SDK models with API responses.

Example:
OpenAISDKModels createWithAPIResponse: apiResponse. ""Returns a new OpenAI SDK model with data from the API response.""


[This comment was created with https://github.com/brackendev/Pharo-OpenAI]
"
Class {
	#name : #OpenAISDKModels,
	#superclass : #Object,
	#instVars : [
		'object',
		'data'
	],
	#category : #'OpenAI-Model'
}

{ #category : #'instance creation' }
OpenAISDKModels class >> createWithAPIResponse: aResponse [

	^ self new
		  object: (aResponse at: 'object');
		  data: ((aResponse at: 'data') collect: [ :e | 
					   OpenAISDKModel createWithAPIResponse: e ])
]

{ #category : #public }
OpenAISDKModels >> allModelRoots [

	^ data collect: [ :e | e root ]
]

{ #category : #accessing }
OpenAISDKModels >> data [

	^ data
]

{ #category : #accessing }
OpenAISDKModels >> data: anObject [

	data := anObject
]

{ #category : #accessing }
OpenAISDKModels >> object [

	^ object
]

{ #category : #accessing }
OpenAISDKModels >> object: anObject [

	object := anObject
]
