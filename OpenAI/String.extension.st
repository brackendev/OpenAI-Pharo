Extension { #name : #String }

{ #category : #'*OpenAI' }
String >> outputTextFile: aFileNameString [

	(File named: aFileNameString) writeStreamDo: [ :stream | 
		stream nextPutAll: self ]
]
