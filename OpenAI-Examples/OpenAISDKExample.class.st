"
Class: OpenAISDKExample

I represent a class that demonstrates the usage of OpenAISDK.

Responsibilities:
- I demonstrate how to create an OpenAISDK instance with an API key and organization.
- I demonstrate how to create an OpenAISDK instance with just an API key.
- I demonstrate how to open the usage page of OpenAISDK.

Collaborators:
- OpenAISDK: I create instances of OpenAISDK and interact with its methods.

Examples:
- ""Create an OpenAISDK instance with API key and organization"": exampleCreateWithAPIKey_organization
- ""Create an OpenAISDK instance with just an API key"": exampleCreateWithAPIKey
- ""Open the usage page of OpenAISDK"": exampleOpenUsagePage


[This comment was automatically created with https://github.com/brackendev/OpenAI-Pharo]
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

{ #category : #examples }
OpenAISDKExample class >> exampleOpenUsagePage [

	<sampleInstance>
	^ OpenAISDK openUsagePage 
]
