"
Class: OpenAIStringExample

I represent a class that provides examples of working with strings, files, and images.

Responsibilities:
- I can create an output text file from a given string.
- I can download an image from a given URL.
- I can provide examples of using these functionalities.

Collaborators:
- FileSystem: I interact with the FileSystem to create and manage output text files.
- ZnClient: I use ZnClient to download images from URLs.

Examples:
- ""Create an output text file named 'example.txt' with the content 'Example'"": OpenAIStringExample exampleOutputTextFile
- ""Download an image from the Pharo website"": OpenAIStringExample exampleImageFromURL


[This comment was automatically created with https://github.com/brackendev/OpenAI-Pharo]
"
Class {
	#name : #OpenAIStringExample,
	#superclass : #Object,
	#category : #'OpenAI-Examples-Extensions'
}

{ #category : #examples }
OpenAIStringExample class >> exampleImageFromURL [

	<sampleInstance>
	^ 'https://pharo.org/web/files/pharo.png'
		  imageFromURL
]

{ #category : #examples }
OpenAIStringExample class >> exampleOutputTextFile [

	<sampleInstance>
	^ 'Example' outputTextFile: 'example.txt'
]
