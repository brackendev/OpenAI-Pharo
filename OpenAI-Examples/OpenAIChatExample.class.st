"
Class: OpenAIChatExample

I represent a class that demonstrates how to start an OpenAI chat session using an API key.

Responsibilities:
- I demonstrate how to create an OpenAI chat session.
- I show how to use an API key to authenticate with the OpenAI SDK.
- I provide an example method for starting a chat session using the SDK.

Collaborators:
- OpenAIChatSession: I start a chat session using this class.
- OpenAISDK: I interact with this class to create an SDK instance with the provided API key.

Example:
- ""Start a chat session using the OpenAI SDK and API key"": OpenAIChatExample exampleStartWithSDK.


[This comment was automatically created with https://github.com/brackendev/OpenAI-Pharo]
"
Class {
	#name : #OpenAIChatExample,
	#superclass : #Object,
	#category : #'OpenAI-Examples-Core'
}

{ #category : #examples }
OpenAIChatExample class >> exampleStartWithSDK [

	<sampleInstance>
	^ OpenAIChatSession startWithSDK: (OpenAISDK createWithAPIKey: 'API_KEY')
]
