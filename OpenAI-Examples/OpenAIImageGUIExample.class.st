"
Class: OpenAIImageGUIExample

I represent a class that demonstrates how to use the OpenAI Image GUI with an API key.

Responsibilities:
- I demonstrate how to create an instance of the OpenAIChatGUI with an API key.
- I provide an example of using the OpenAI Image GUI with the OpenAISDK.
- I serve as a reference for developers to understand how to use the OpenAI Image GUI in their projects.

Collaborators:
- OpenAIChatGUI: I create an instance of this class with the provided API key.
- OpenAISDK: I use this class to create an instance with the given API key.

Example:
- ""exampleOpenWithSDK"": This method demonstrates how to create an instance of the OpenAIChatGUI with an API key.


[This comment was automatically created with https://github.com/brackendev/OpenAI-Pharo]
"
Class {
	#name : #OpenAIImageGUIExample,
	#superclass : #Object,
	#category : #'OpenAI-Examples-GUI'
}

{ #category : #examples }
OpenAIImageGUIExample class >> exampleOpenWithSDK [

	<sampleInstance>
	^ OpenAIChatGUI openWithSDK: (OpenAISDK createWithAPIKey: 'API_KEY')
]
