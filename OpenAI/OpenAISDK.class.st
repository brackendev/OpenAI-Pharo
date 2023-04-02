"
Class: OpenAISDK

I represent a class that creates a connection to the OpenAI API.

Responsibilities:
- Create a connection to the OpenAI API using an API key and optionally an organization string.
- Set headers for the API request.
- Return a new instance of the class with the created client.

Collaborators:
- ZnClient: used to create the HTTP client for the API request.

Example:
""Create a new OpenAISDK instance with the provided API key.""
OpenAISDK createWithAPIKey: 'myAPIkey' organization: nil.


[This comment was automatically generated with https://github.com/brackendev/Pharo-OpenAI]
"
Class {
	#name : #OpenAISDK,
	#superclass : #Object,
	#instVars : [
		'client'
	],
	#category : #'OpenAI-Core'
}

{ #category : #public }
OpenAISDK class >> createWithAPIKey: anAPIKeyString [

	^ self createWithAPIKey: anAPIKeyString organization: nil
]

{ #category : #public }
OpenAISDK class >> createWithAPIKey: anAPIKeyString organization: anOrganizationString [

	"Get an API key at https://platform.openai.com/account/api-keys"
	"https://platform.openai.com/docs/api-reference/authentication"

	| client |
	client := ZnClient new.
	client headerAt: 'Content-Type' put: 'application/json'.
	client headerAt: 'Authorization' put: 'Bearer ' , anAPIKeyString.
	anOrganizationString isNotNil ifTrue: [ 
		client headerAt: 'OpenAI-Organization' put: anOrganizationString ].
	^ self new client: client
]

{ #category : #private }
OpenAISDK >> baseURL [ 
^ 'https://api.openai.com/v1'
]

{ #category : #accessing }
OpenAISDK >> client [

	^ client
]

{ #category : #accessing }
OpenAISDK >> client: anObject [

	client := anObject
]

{ #category : #public }
OpenAISDK >> createChatCompletionWithMessages: aChatObjectArray [

	^ self
		  createChatCompletionWithMessages: aChatObjectArray
		  model: 'gpt-3.5-turbo'
]

{ #category : #public }
OpenAISDK >> createChatCompletionWithMessages: aChatObjectsArray model: aModelString [

	"https://platform.openai.com/docs/api-reference/chat/create"

	| dict theClient json response decoded |
	dict := { 
		        ('model' -> aModelString).
		        ('messages' -> (aChatObjectsArray collect: [ :e | e toDictionary ])) } asDictionary.
	json := NeoJSONWriter toString: dict.
	theClient := self client.
	theClient entity:
		(ZnEntity with: json type: ZnMimeType applicationJson).
	theClient url: self baseURL , '/chat/completions'.
	response := theClient post.
	decoded := NeoJSONReader fromString: response.
	(decoded includesKey: 'error')
		ifTrue: [ ^ OpenAISDKError createWithAPIResponse: decoded ]
		ifFalse: [ 
		^ OpenAISDKChatCompletion createWithAPIResponse: decoded ]
]

{ #category : #public }
OpenAISDK >> createImageWithPrompt: aPromptString [

	^ self createImageWithPrompt: aPromptString number: 1 size: '1024x1024'
]

{ #category : #public }
OpenAISDK >> createImageWithPrompt: aPromptString number: aNumberString size: aSizeString [

	"https://platform.openai.com/docs/api-reference/images/create"

	| dict theClient json response decoded |
	dict := { 
		        ('prompt' -> aPromptString).
		        ('n' -> aNumberString).
		        ('size' -> aSizeString) } asDictionary.
	json := NeoJSONWriter toString: dict.
	theClient := self client.
	theClient entity:
		(ZnEntity with: json type: ZnMimeType applicationJson).
	theClient url: self baseURL , '/images/generations'.
	response := theClient post.
	decoded := NeoJSONReader fromString: response.
	(decoded includesKey: 'error')
		ifTrue: [ ^ OpenAISDKError createWithAPIResponse: decoded ]
		ifFalse: [ 
		^ OpenAISDKImage createWithAPIResponse: decoded ]
]

{ #category : #public }
OpenAISDK >> listModels [

	"https://platform.openai.com/docs/api-reference/models/list"

	| theClient response decoded |
	theClient := self client.
	theClient url: self baseURL , '/models'.
	response := theClient get.
	decoded := NeoJSONReader fromString: response.
	(decoded includesKey: 'error')
		ifTrue: [ ^ OpenAISDKError createWithAPIResponse: decoded ]
		ifFalse: [ 
		^ OpenAISDKModels createWithAPIResponse: decoded ]
]

{ #category : #public }
OpenAISDK >> retrieveModel: aModelString [

	"https://platform.openai.com/docs/api-reference/models/retrieve"

	| theClient response decoded |
	theClient := self client.
	theClient url: self baseURL , '/models/' , aModelString.
	response := theClient get.
	decoded := NeoJSONReader fromString: response.
	(decoded includesKey: 'error')
		ifTrue: [ ^ OpenAISDKError createWithAPIResponse: decoded ]
		ifFalse: [ 
		^ OpenAISDKModel createWithAPIResponse: decoded ]
]
