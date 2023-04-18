"
Class: OpenAIImageMorphExample

I represent a class that demonstrates the usage of ImageMorph to output a PNG file.

Responsibilities:
- Create an instance of ImageMorph with a specified output file name.
- Output a PNG file using the ImageMorph instance.
- Provide an example of using the class to output a PNG file.

Collaborators:
- ImageMorph: I create an instance of ImageMorph and interact with it to output a PNG file.

Example:
- ""Create an instance of OpenAIImageMorphExample and output a PNG file"": OpenAIImageMorphExample exampleOutputPNGFile.


[This comment was automatically created with https://github.com/brackendev/OpenAI-Pharo]
"
Class {
	#name : #OpenAIImageMorphExample,
	#superclass : #Object,
	#category : #'OpenAI-Examples-Extensions'
}

{ #category : #examples }
OpenAIImageMorphExample class >> exampleOutputPNGFile [

	<sampleInstance>
	^ ImageMorph new outputPNGFile: 'example'
]
