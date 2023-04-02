"
Class: ImageMorphExample

I represent a class that provides an example method to output an ImageMorph as a PNG file.

Responsibilities:
- Create an example output PNG file using an ImageMorph object.
- Hold no instance variables.

Collaborators:
- ImageMorph - The class from which I create a new instance to output as PNG.
- None - I operate independently.

Example:
ImageMorphExample exampleOutputPNGFile ""returns an example PNG file of an ImageMorph object.""


[This comment was created with https://github.com/brackendev/Pharo-OpenAI]
"
Class {
	#name : #ImageMorphExample,
	#superclass : #Object,
	#category : #'OpenAI-Examples-Extensions'
}

{ #category : #examples }
ImageMorphExample class >> exampleOutputPNGFile [

	<sampleInstance>
	^ ImageMorph new outputPNGFile: 'example'
]
