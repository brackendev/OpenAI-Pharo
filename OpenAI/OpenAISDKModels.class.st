"
Class: OpenAISDKModels

I represent a collection of OpenAI SDK models.

Responsibilities:
- I create instances of myself using API responses.
- I store the object and data from the API response.
- I convert the data into a collection of OpenAISDKModel instances.

Collaborators:
- OpenAISDKModel: I create instances of OpenAISDKModel using the data from the API response.

Example:
- ""Create an OpenAISDKModels instance from an API response: `models := OpenAISDKModels createWithAPIResponse: apiResponse`""


[This comment was automatically created with https://github.com/brackendev/OpenAI-Pharo]
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
