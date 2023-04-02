"
Class: OpenAISDKModel

I represent a class responsible for creating new instances of the OpenAISDKModel class. I know how to initialize instances with API responses.

Responsibilities:
- Create instances of OpenAISDKModel
- Extract data from API responses
- Initialize instances with attributes from API responses

Collaborators:
- API responses
- OpenAISDKModel instances
- Data access methods

Example: Creating a new instance of OpenAISDKModel with an API response. ""OpenAISDKModel createWithAPIResponse: aApiResponse returns a new instance of OpenAISDKModel with attributes initialized from aApiResponse.""


[This comment was created with https://github.com/brackendev/Pharo-OpenAI]
"
Class {
	#name : #OpenAISDKModel,
	#superclass : #Object,
	#instVars : [
		'ownedBy',
		'parent',
		'root',
		'permission',
		'created',
		'object',
		'id'
	],
	#category : #'OpenAI-Model'
}

{ #category : #'instance creation' }
OpenAISDKModel class >> createWithAPIResponse: aResponse [

	^ self new
		  ownedBy: (aResponse at: 'owned_by');
		  parent: (aResponse at: 'parent');
		  root: (aResponse at: 'root');
		  permission: (aResponse at: 'permission');
		  created: (aResponse at: 'created');
		  object: (aResponse at: 'object');
		  id: (aResponse at: 'id')
]

{ #category : #accessing }
OpenAISDKModel >> created [

	^ created
]

{ #category : #accessing }
OpenAISDKModel >> created: anObject [

	created := anObject
]

{ #category : #accessing }
OpenAISDKModel >> id [

	^ id
]

{ #category : #accessing }
OpenAISDKModel >> id: anObject [

	id := anObject
]

{ #category : #accessing }
OpenAISDKModel >> object [

	^ object
]

{ #category : #accessing }
OpenAISDKModel >> object: anObject [

	object := anObject
]

{ #category : #accessing }
OpenAISDKModel >> ownedBy [

	^ ownedBy
]

{ #category : #accessing }
OpenAISDKModel >> ownedBy: anObject [

	ownedBy := anObject
]

{ #category : #accessing }
OpenAISDKModel >> parent [

	^ parent
]

{ #category : #accessing }
OpenAISDKModel >> parent: anObject [

	parent := anObject
]

{ #category : #accessing }
OpenAISDKModel >> permission [

	^ permission
]

{ #category : #accessing }
OpenAISDKModel >> permission: anObject [

	permission := anObject
]

{ #category : #accessing }
OpenAISDKModel >> root [

	^ root
]

{ #category : #accessing }
OpenAISDKModel >> root: anObject [

	root := anObject
]
