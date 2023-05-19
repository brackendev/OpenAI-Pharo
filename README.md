OpenAI-Pharo
============

**A powerful [OpenAI](https://platform.openai.com/) playground for pro-users and developers.**

* Chat
  * Interact with unlimited chatbots using different models
    * Programatically and GUI
  * Use responses within the live Pharo environment
    * Inspect and evaluate responses to objects
  * Export chats as JSON
* Image Generation
  * Generate images with different sizes
    * Programatically and GUI
  * Use images within the live Pharo environment
  * Export images as PNGs
* **_Bonus!_** 
  * Automatically update Pharo class comments with a generated [Class Responsibility Collaborator](https://en.wikipedia.org/wiki/Class-responsibility-collaboration_card) (based on class definitions and source code)

![](images/screenshot.png)

## Requirements

* [OpenAI](https://platform.openai.com/) API key
* [Pharo 11](https://www.pharo.org/) installation

## Installation

1. Go to <https://platform.openai.com/account/api-keys> to set up an API key.
2. In a [Pharo 11](https://www.pharo.org/) Playground, _Do it_:

```smalltalk
Metacello new 
  repository: 'github://brackendev/OpenAI-Pharo/src';
  baseline: 'OpenAI';
  load.
```

## Example Usage

(An [examples package](https://github.com/brackendev/OpenAI-Pharo/tree/master/OpenAI-Examples) is also included.)

```smalltalk
"Lists the currently available models."

(OpenAISDK createWithAPIKey: 'API_KEY') listModels.
```

```smalltalk
"Programatically use a chat session."

sdk := (OpenAISDK createWithAPIKey: 'API_KEY').
chatSession := OpenAIChatSession startWithSDK: sdk.
chatSession model: 'gpt-4'. "Optional. Default is gpt-3.5-turbo"
chatSession submitSystemPrompt: 'You are a chatbot named OMM 0000.'.
chatSession submitUserPrompt: 'Who are you?'.
chatSession lastChat inspect. "Inspects the response: I am OMM 0000..."
chatSession submitUserPrompt: 'Show me Pharo code to add numbers to your name. Respond with only Pharo code, no other text, no code block.'.
chatSession lastChat inspect. "Inspects the Pharo code response"
chatSession lastChat evaluate inspect. "Inspects the Pharo code evaluated"
```

```smalltalk
"Programtically generate images"

sdk := (OpenAISDK createWithAPIKey: 'API_KEY').
sdk createImageWithPrompt: 'An elephant drinking water on the moon' number: 2 size: '1024x1024'.
```

```smalltalk
"Open a chat session GUI."

sdk := (OpenAISDK createWithAPIKey: 'API_KEY').
OpenAIChatGUI openWithSDK: sdk.
```

```smalltalk
"Open an image generation GUI."

sdk := (OpenAISDK createWithAPIKey: 'API_KEY').
OpenAIImageGUI openWithSDK: sdk.
```

```smalltalk
"Update any class comment with the generated Class Responsibility Collaborator (based on class definitions and source code)."

sdk := (OpenAISDK createWithAPIKey: 'API_KEY').
AnyClassYouWant updateCommentWithOpenAICRCWithSDK: sdk.
```

## Documentation

### Extension Methods

* [**Class** _classResponsibilityCollaboratorWithSDK_](https://github.com/brackendev/OpenAI-Pharo/blob/master/OpenAI/Class.extension.st) - Generate a [Class Responsibility Collaborator](https://en.wikipedia.org/wiki/Class-responsibility-collaboration_card) for a class (based on class definitions and source code).
* [**Class** _definitionAndSourceCode_](https://github.com/brackendev/OpenAI-Pharo/blob/master/OpenAI/Class.extension.st) - Retrieve the definition and source code for a class.
* [**Class** _updateCommentWithOpenAICRCWithSDK_](https://github.com/brackendev/OpenAI-Pharo/blob/master/OpenAI/Class.extension.st) - Update a class comment with a generated [Class Responsibility Collaborator](https://en.wikipedia.org/wiki/Class-responsibility-collaboration_card).
* [**ImageMorph** _outputPNGFile_](https://github.com/brackendev/OpenAI-Pharo/blob/master/OpenAI/ImageMorph.extension.st) - Export an ImageMorph to a PNG file. [OpenAIImageGUI](https://github.com/brackendev/OpenAI-Pharo/blob/master/OpenAI/OpenAIImageGUI.class.st) uses this to export images.
* [**String** _imageFromURL_](https://github.com/brackendev/OpenAI-Pharo/blob/master/OpenAI/String.extension.st) - Retrieve an image from a URL. [OpenAIImageGUI](https://github.com/brackendev/OpenAI-Pharo/blob/master/OpenAI/OpenAIImageGUI.class.st) uses this to retrieve images.
* [**String** _outputTextFile_](https://github.com/brackendev/OpenAI-Pharo/blob/master/OpenAI/String.extension.st) - Export a string to a text file. [OpenAIChatGUI](https://github.com/brackendev/OpenAI-Pharo/blob/master/OpenAI/OpenAIChatGUI.class.st) uses this to export chats.

## TODO

- [ ] More testing for errors, token limits, etc.
- [ ] Add more documentation and examples

## Acknowledgements

This project makes use of the following third-party libraries and utilities:

* [NeoJSON](https://github.com/svenvc/NeoJSON)
* [Zinc HTTP Components](https://github.com/svenvc/zinc) (Now included with Pharo 11)

## Author

Bracken Spencer

* [GitHub](https://www.github.com/brackendev)
* [LinkedIn](https://www.linkedin.com/in/brackenspencer/)
* [Mastodon](https://mastodon.cloud/@brackendev)
* [Twitter](https://twitter.com/brackendev)

## License

OpenAI-Pharo is released under the MIT license. See the LICENSE file for more info.
