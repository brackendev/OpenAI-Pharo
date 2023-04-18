"
Class: OpenAISDKModel

I represent a class that manages OpenAI SDK models.

Responsibilities:
- I create instances of OpenAISDKModel with API response data.
- I store information about the model's owner, parent, root, permission, creation time, object, and ID.
- I provide access to the stored information for other classes.

Collaborators:
- APIResponse: I receive data from API responses to create instances of OpenAISDKModel.

Example:
- ""Create an OpenAISDKModel instance with API response data: `model := OpenAISDKModel createWithAPIResponse: aResponse`""


[This comment was automatically created with https://github.com/brackendev/OpenAI-Pharo]
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
