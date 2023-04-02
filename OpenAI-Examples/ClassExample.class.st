"
Class: ClassExample class

I represent a class that provides examples of how to use certain features in Smalltalk.

Responsibilities:
- Provide an example of updating a comment using the OpenAISDK API.
- Provide an example of getting the definition and source code of a class.
- Provide an example of using the Class Responsibility Collaborator (CRC) with the OpenAISDK API.

Collaborators:
- OpenAISDK - used to interact with the OpenAI API to update comments and use CRC.
- Class - used to retrieve the definition and source code of a class.

Example:
ClassExample exampleDefinitionAndSourceCode ""returns the definition and source code of the ClassExample class""


[This comment was created with https://github.com/brackendev/Pharo-OpenAI]
"
Class {
	#name : #ClassExample,
	#superclass : #Object,
	#category : #'OpenAI-Examples-Extensions'
}

{ #category : #examples }
ClassExample class >> exampleClassResponsibilityCollaboratorWithSDK [

	<sampleInstance>
	^ Class classResponsibilityCollaboratorWithSDK:
		  (OpenAISDK createWithAPIKey:
			   'API_KEY')
]

{ #category : #examples }
ClassExample class >> exampleDefinitionAndSourceCode [

	<sampleInstance>
	^ Class definitionAndSourceCode
]

{ #category : #examples }
ClassExample class >> exampleUpdateCommentWithOpenAICRCWithSDK [

	<sampleInstance>
	^ Class updateCommentWithOpenAICRCWithSDK:
		  (OpenAISDK createWithAPIKey: 'API_KEY')
]
