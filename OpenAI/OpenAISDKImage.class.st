"
Class: OpenAISDKImage

I represent a class that creates an instance of a OpenAISDK image. I know how to take an API response and extract the created and data values from it.

Main Collaborators:
- OpenAISDKImage instance: I create instances of this class based on API responses.

Example:
OpenAISDKImage createWithAPIResponse: aResponse.
""Creates a new instance of OpenAISDKImage based on an API response and returns it.""


[This comment was created with https://github.com/brackendev/Pharo-OpenAI]
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
