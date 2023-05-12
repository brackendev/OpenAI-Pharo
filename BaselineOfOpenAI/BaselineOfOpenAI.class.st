"
Class: BaselineOfOpenAI

I represent a class that defines dependencies required for OpenAI libraries to be included in a Pharo project.

Responsibilities:

- I define required packages and versions for OpenAI libraries.
- I download and install the required packages when requested.
- I provide a baseline specification for OpenAI packages in a project.

Collaborators:

- Metacello: I collaborate with Metacello to manage dependencies and package loading in a Pharo project.

Example:

BaselineOfOpenAI new
    load: #(OpenAI); ""Load OpenAI package into the project""
    commit ""Commit the changes to the package tree""


[This comment was created with https://github.com/brackendev/Pharo-OpenAI]
"
Class {
	#name : #BaselineOfOpenAI,
	#superclass : #BaselineOf,
	#category : #BaselineOfOpenAI
}

{ #category : #baselines }
BaselineOfOpenAI >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec package: 'OpenAI'.
		spec
			package: 'OpenAI-Examples'
			with: [ spec requires: #( 'OpenAI' ) ].
		spec baseline: 'NeoJSON' with: [ 
			spec
				repository: 'github://svenvc/NeoJSON'
			]
		]
]
