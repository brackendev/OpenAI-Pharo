"
Class: OpenAISDKError

I represent a class responsible for creating OpenAI SDK errors, given an API response.

- Extract the error information from the API response.
- Create a new instance of OpenAISDKError with the extracted error information.
- Set the code, param, type, and message for the OpenAISDKError instance.

My main collaborator is the API response object. I extract error information from it and use it to create an OpenAISDKError instance.

Example:

""Create an OpenAISDKError from an API response""
response := '{""error"": {""code"": 400, ""type"": ""invalid_request"", ""message"": ""Invalid parameter: frequency. Must be in [ordinal, observed, mean, sum, percentile25, ..., percentile95]."", ""param"": ""frequency""}}'.
aResponse := Dictionary new readStream: response asByteArray.
error := OpenAISDKError createWithAPIResponse: aResponse.
""Creates a new OpenAISDKError instance with the given error information extracted from the API response.""


[This comment was created with https://github.com/brackendev/Pharo-OpenAI]
"
Class {
	#name : #OpenAISDKError,
	#superclass : #Object,
	#instVars : [
		'param',
		'type',
		'message',
		'code'
	],
	#category : #'OpenAI-Model'
}

{ #category : #'instance creation' }
OpenAISDKError class >> createWithAPIResponse: aResponse [

	| e |
	e := aResponse at: 'error'.
	^ self new
		  code: (e at: 'code');
		  param: (e at: 'param');
		  type: (e at: 'type');
		  message: (e at: 'message')
]

{ #category : #accessing }
OpenAISDKError >> code [

	^ code
]

{ #category : #accessing }
OpenAISDKError >> code: anObject [

	code := anObject
]

{ #category : #accessing }
OpenAISDKError >> message [

	^ message
]

{ #category : #accessing }
OpenAISDKError >> message: anObject [

	message := anObject
]

{ #category : #accessing }
OpenAISDKError >> param [

	^ param
]

{ #category : #accessing }
OpenAISDKError >> param: anObject [

	param := anObject
]

{ #category : #accessing }
OpenAISDKError >> type [

	^ type
]

{ #category : #accessing }
OpenAISDKError >> type: anObject [

	type := anObject
]
