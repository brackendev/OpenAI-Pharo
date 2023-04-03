OpenAI-Pharo
============

**A powerful [OpenAI](https://platform.openai.com/) playground for pro-users and developers.**

* Interact with unlimited chatbots using different models, programatically and via GUIs. Export chats as JSON.
* Generate images with different sizes, programatically and via GUIs. Export images as PNGs.
* **_Bonus!_** Automatically update Pharo class comments with the [Class Responsibility Collaborator](https://en.wikipedia.org/wiki/Class-responsibility-collaboration_card) that OpenAI creates.

![](images/screenshot.png)

## Requirements

* [OpenAI](https://platform.openai.com/) API key
* [Pharo 10](https://www.pharo.org/) installation

## Installation

1. Go to <https://platform.openai.com/account/api-keys> to set up an API key.
2. In a Pharo 10 Playground, _Do it_:

```smalltalk
Metacello new 
  repository: 'github://brackendev/OpenAI-Pharo/src';
  baseline: 'OpenAI';
  load.
```

## Example Usage

```smalltalk
"Lists the currently available models."

(OpenAISDK createWithAPIKey: 'API_KEY') listModels.
```

```smalltalk
"Programatically use a chat session."

sdk := (OpenAISDK createWithAPIKey: 'API_KEY').
chat := OpenAIChat startWithSDK: sdk.
chat submitSystemPrompt: 'You are a chatbot named OMM 0000.'.
chat submitUserPrompt: 'Who are you?'.
chat lastChat. "I am OMM 0000, a language model AI chatbot..."
chat submitUserPrompt: 'Who created you?'.
chat lastChat. "I was created by OpenAI..."
```

```smalltalk
"Programtically generate images"

sdk := (OpenAISDK createWithAPIKey: 'API_KEY').sdk createImageWithPrompt: 'An elephant drinking water on the moon' number: 2 size: '1024x1024'.
```

```smalltalk
"Open a chat session GUI."
"/export - Export the chat to a JSON file"
"/system A new system prompt"

sdk := (OpenAISDK createWithAPIKey: 'API_KEY').
sdk model: 'gpt-4'. "Optional. Default is gpt-3.5-turbo"
OpenAIChatGUI openWithSDK: sdk.
```

```smalltalk
"Open an image generation GUI."
"/export - Export the image to a PNG file"
"/imagesize '256x256' or '512x512' or '1024x1024'"

sdk := (OpenAISDK createWithAPIKey: 'API_KEY').
OpenAIImageGUI openWithSDK: sdk.
```

```smalltalk
"Update any class comment with the [Class Responsibility Collaborator](https://en.wikipedia.org/wiki/Class-responsibility-collaboration_card) that OpenAI creates (based on the class definition and source code)."

sdk := (OpenAISDK createWithAPIKey: 'API_KEY').
AnyClassYouWant updateCommentWithOpenAICRCWithSDK: sdk.
```

An [examples package](https://github.com/brackendev/OpenAI-Pharo/tree/master/OpenAI-Examples) is also included.

## Documentation

### TODO

### Helpful Extension Methods

* **Class** _classResponsibilityCollaboratorWithSDK_ - Retrieve the  [Class Responsibility Collaborator](https://en.wikipedia.org/wiki/Class-responsibility-collaboration_card)  for a class.
* **Class** _definitionAndSourceCode_ - Retrieve the definition and source code for a class.
* **Class** _updateCommentWithOpenAICRCWithSDK_ - Update a class comment with the  [Class Responsibility Collaborator](https://en.wikipedia.org/wiki/Class-responsibility-collaboration_card)  that is generated.
* **ImageMorph** _outputPNGFile_ - Export an ImageMorph to a PNG file. This is what [OpenAIImageGUI](https://github.com/brackendev/OpenAI-Pharo/blob/master/OpenAI/OpenAIImageGUI.class.st) uses.
* **String** _outputTextFile_ - Export a string to a text file. This is what [OpenAIChatGUI](https://github.com/brackendev/OpenAI-Pharo/blob/master/OpenAI/OpenAIChatGUI.class.st) uses.

## Author

Bracken Spencer

* [GitHub](https://www.github.com/brackendev)
* [LinkedIn](https://www.linkedin.com/in/brackenspencer/)
* [Mastodon](https://mastodon.cloud/@brackendev)
* [Twitter](https://twitter.com/brackendev)

## License

OpenAI-Pharo is released under the MIT license. See the LICENSE file for more info.