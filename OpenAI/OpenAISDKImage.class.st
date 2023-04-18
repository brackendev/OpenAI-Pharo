"
Class: OpenAISDKImage

I represent an image object in the OpenAI SDK.

Responsibilities:
- I store the creation timestamp of the image.
- I store the image data.
- I can be created from an API response.

Collaborators:
- APIResponse: I interact with APIResponse to extract the necessary information to create an instance of myself.

Example:
- ""Create an OpenAISDKImage instance from an API response: `image := OpenAISDKImage createWithAPIResponse: aResponse`""


[This comment was automatically created with https://github.com/brackendev/OpenAI-Pharo]
"
Class {
	#name : #OpenAISDKImage,
	#superclass : #Object,
	#instVars : [
		'created',
		'data'
	],
	#category : #'OpenAI-Model'
}

{ #category : #'instance creation' }
OpenAISDKImage class >> createWithAPIResponse: aResponse [

	^ self new
		  created: (aResponse at: 'created');
		  data: (aResponse at: 'data')
]

{ #category : #accessing }
OpenAISDKImage >> created [

	^ created
]

{ #category : #accessing }
OpenAISDKImage >> created: anObject [

	created := anObject
]

{ #category : #accessing }
OpenAISDKImage >> data [

	^ data
]

{ #category : #accessing }
OpenAISDKImage >> data: anObject [

	data := anObject
]

{ #category : #public }
OpenAISDKImage >> images [

	^ self urls collect: [ :e | 
		  (ImageReadWriter formFromStream:
			   (ZnEasy get: e) contents readStream) asMorph
		  ]
]

{ #category : #public }
OpenAISDKImage >> urls [

	^ self data collect: [ :e | e at: 'url' ]
]

{ #category : #public }
OpenAISDKImage >> writeImagesOut [

	self images do: [ :e | e outputPNGFile: (UUID new asString) ]
]
