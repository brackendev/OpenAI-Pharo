Extension { #name : #ImageMorph }

{ #category : #'*OpenAI' }
ImageMorph >> outputPNGFile: aFileNameString [

	| form pngWriter pngStream |
	form := self imageForm.
	pngWriter := PNGReadWriter on:
		             (pngStream := ByteArray new writeStream).
	pngWriter nextPutImage: form.
	(File named: aFileNameString , '.png') writeStreamDo: [ :stream | 
		stream
			binary;
			nextPutAll: pngStream contents
		]
]
