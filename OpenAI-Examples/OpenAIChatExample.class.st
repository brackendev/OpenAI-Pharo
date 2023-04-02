"
Class: OpenAIChatExample

I represent a class that provides an example of how to start using OpenAIChat. I use the OpenAISDK to create an instance of OpenAIChat and start a chat session.

Responsibilities:
- Create an instance of OpenAIChat using OpenAISDK.
- Start a chat session with the created instance of OpenAIChat.
- Provide an example of how to start using OpenAIChat.

Collaborators:
- OpenAIChat: I use this class to create and start a chat session with.
- OpenAISDK: I use this class to create an instance of OpenAIChat.

Example:
OpenAIChatExample exampleStartWithSDK.
""Creates an instance of OpenAIChat using OpenAISDK and starts a chat session.""


[This comment was created with https://github.com/brackendev/Pharo-OpenAI]
"
Class {
	#name : #OpenAIChatExample,
	#superclass : #Object,
	#category : #'OpenAI-Examples-Core'
}

{ #category : #examples }
OpenAIChatExample class >> exampleStartWithSDK [

	<sampleInstance>
	^ OpenAIChat startWithSDK: (OpenAISDK createWithAPIKey: 'API_KEY')
]
