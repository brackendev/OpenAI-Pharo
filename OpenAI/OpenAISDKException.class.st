"
Class: OpenAISDKException

I represent an exception class for the OpenAI SDK.

Responsibilities:
- I handle exceptions related to the OpenAI SDK.
- I know how to initialize myself with an object.
- I can signal an exception with a specific object.

Collaborators:
- OpenAI SDK: I interact with the OpenAI SDK to handle exceptions that may occur during its usage.

Example:
- ""OpenAISDKException signalForObject: someObject"" signals an exception with the given object.


[This comment was automatically created with https://github.com/brackendev/OpenAI-Pharo]
"
Class {
	#name : #OpenAISDKException,
	#superclass : #Exception,
	#instVars : [
		'relatedObject'
	],
	#category : #'OpenAI-Model'
}

{ #category : #signalling }
OpenAISDKException class >> signalForObject: anObject [
    ^ self new initializeWithObject: anObject; signal
]

{ #category : #initialization }
OpenAISDKException >> initializeWithObject: anObject [

	self initialize.
	relatedObject := anObject
]
