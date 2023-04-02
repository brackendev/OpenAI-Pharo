"
Class: OpenAISDKExample

I represent a class that contains examples for using the OpenAI SDK.

Responsibilities:
- Provide an example of creating an OpenAISDK instance with an API key.
- Provide an example of creating an OpenAISDK instance with an API key and organization.
- Knows how to use the OpenAISDK to create instances.

Collaborators:
- OpenAISDK class: Used to create instances of the OpenAISDK class.

Example:
""Create an OpenAISDK instance with API key 'API_KEY'""
OpenAISDKExample exampleCreateWithAPIKey.


[This comment was created with https://github.com/brackendev/Pharo-OpenAI]
"
Class {
	#name : #OpenAISDKExample,
	#superclass : #Object,
	#category : #'OpenAI-Examples-Core'
}

{ #category : #examples }
OpenAISDKExample class >> exampleCreateWithAPIKey [

	<sampleInstance>
	^ OpenAISDK createWithAPIKey:
		  'API_KEY'
]

{ #category : #examples }
OpenAISDKExample class >> exampleCreateWithAPIKey_organization [

	<sampleInstance>
	^ OpenAISDK createWithAPIKey: 'API_KEY' organization: 'ORGANIZATION'
]
