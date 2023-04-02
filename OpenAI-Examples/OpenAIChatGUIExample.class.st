"
Class: OpenAIChatGUIExample

I represent a class that provides an example of using the OpenAIChatGUI with an SDK.

Responsibilities:
- Provide an example of how to open the OpenAIChatGUI with an SDK.
- Know how to create an OpenAISDK with an API key.
- Know how to use the OpenAIChatGUI class.

Collaborators:
- OpenAIChatGUI class: provides the GUI for the chat application.
- OpenAISDK class: provides access to the OpenAI API.
- API key: required to authenticate access to the OpenAI API.

Example:
OpenAIChatGUIExample exampleOpenWithSDK ""opens the chat GUI with an SDK""


[This comment was created with https://github.com/brackendev/Pharo-OpenAI]
"
Class {
	#name : #OpenAIChatGUIExample,
	#superclass : #Object,
	#category : #'OpenAI-Examples-GUI'
}

{ #category : #examples }
OpenAIChatGUIExample class >> exampleOpenWithSDK [

	<sampleInstance>
	^ OpenAIChatGUI openWithSDK: (OpenAISDK createWithAPIKey: 'API_KEY')
]
