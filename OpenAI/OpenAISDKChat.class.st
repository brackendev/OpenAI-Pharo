"
Class: OpenAISDKChat

I represent a class responsible for creating a chat instance with a specified role and content.

Responsibilities:
- Create a new chat instance.
- Set the role of the chat instance.
- Set the content of the chat instance.

Collaborators:
- OpenAISDKChat instance: An instance of the OpenAISDKChat class used to create chat instances.
- aRoleString: A string representing the role of the chat instance.
- aContentString: A string representing the content of the chat instance.

Example:
OpenAISDKChat createWithRole: 'Customer' content: 'I need help with my order.' ""Creates a new chat instance for a customer with a question about their order.""


[This comment was created with https://github.com/brackendev/Pharo-OpenAI]
"
Class {
	#name : #OpenAISDKChat,
	#superclass : #Object,
	#instVars : [
		'role',
		'content'
	],
	#category : #'OpenAI-Model'
}

{ #category : #'instance creation' }
OpenAISDKChat class >> createWithRole: aRoleString content: aContentString [

	^ self new
		  role: aRoleString;
		  content: aContentString
]

{ #category : #accessing }
OpenAISDKChat >> content [

	^ content
]

{ #category : #accessing }
OpenAISDKChat >> content: anObject [

	content := anObject
]

{ #category : #accessing }
OpenAISDKChat >> role [

	^ role
]

{ #category : #accessing }
OpenAISDKChat >> role: anObject [

	role := anObject
]

{ #category : #serialization }
OpenAISDKChat >> toDictionary [

	^ {  ('role' -> role).
		  ('content' -> content) } asDictionary
]
