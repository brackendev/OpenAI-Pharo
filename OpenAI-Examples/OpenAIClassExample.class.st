"
Class: OpenAIClassExample

I represent a class that interacts with the OpenAI API using an SDK.

Responsibilities:
- I create instances of the OpenAI SDK with a given API key.
- I provide examples of using the class with the OpenAI SDK.
- I handle the interaction between the class and the OpenAI API.

Collaborators:
- OpenAISDK: I use the OpenAISDK to interact with the OpenAI API.

Examples:
- ""Create an instance of the class with the OpenAI SDK"": OpenAIClassExample exampleClassResponsibilityCollaboratorWithSDK.
- ""Update a comment using the OpenAI CRC with the SDK"": OpenAIClassExample exampleUpdateCommentWithOpenAICRCWithSDK.
- ""Get the definition and source code of the class"": OpenAIClassExample exampleDefinitionAndSourceCode.


[This comment was automatically created with https://github.com/brackendev/OpenAI-Pharo]
"
Class {
	#name : #OpenAIClassExample,
	#superclass : #Object,
	#category : #'OpenAI-Examples-Extensions'
}

{ #category : #examples }
OpenAIClassExample class >> exampleClassResponsibilityCollaboratorWithSDK [

	<sampleInstance>
	^ Class classResponsibilityCollaboratorWithSDK:
		  (OpenAISDK createWithAPIKey:
			   'API_KEY')
]

{ #category : #examples }
OpenAIClassExample class >> exampleDefinitionAndSourceCode [

	<sampleInstance>
	^ Class definitionAndSourceCode
]

{ #category : #examples }
OpenAIClassExample class >> exampleUpdateCommentWithOpenAICRCWithSDK [

	<sampleInstance>
	^ Class updateCommentWithOpenAICRCWithSDK:
		  (OpenAISDK createWithAPIKey: 'API_KEY')
]
