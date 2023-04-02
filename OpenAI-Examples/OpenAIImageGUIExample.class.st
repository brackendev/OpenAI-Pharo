"
Class: OpenAIImageGUIExample

I represent a class that provides examples of how to use the OpenAIImageGUI class.

Responsibilities:
- Provide an example of how to open the OpenAIImageGUI with an SDK.
- Provide an example of how to open the OpenAIImageGUI with an SDK and a specific image size.
- Use the OpenAIChatGUI and OpenAISDK classes to interact with the OpenAIImageGUI.

Collaborators:
- OpenAIChatGUI
- OpenAISDK
- OpenAIImageGUI

Example:
""Example of opening the OpenAIImageGUI with an SDK""
OpenAIImageGUIExample exampleOpenWithSDK.
""Example of opening the OpenAIImageGUI with an SDK and specific image size""
OpenAIImageGUIExample exampleOpenWithSDK_imageSize.


[This comment was created with https://github.com/brackendev/Pharo-OpenAI]
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

{ #category : #examples }
OpenAIImageGUIExample class >> exampleOpenWithSDK_imageSize [

	<sampleInstance>
	^ OpenAIImageGUI
		openWithSDK: (OpenAISDK createWithAPIKey: 'API_KEY')
		imageSize: '1024x1024'
]
