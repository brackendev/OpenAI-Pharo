Extension { #name : #String }

{ #category : #'*OpenAI' }
String >> imageFromURL [

	^ ImageReadWriter formFromStream:
		  (ZnEasy get: self) contents readStream
]

{ #category : #'*OpenAI' }
String >> outputTextFile: aFileNameString [

	(File named: aFileNameString) writeStreamDo: [ :stream | 
		stream nextPutAll: self ]
]
