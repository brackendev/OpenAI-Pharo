OpenAI-Pharo
============

**Interact with [OpenAI](https://platform.openai.com/) on Pharo.**

* [Pharo 10](https://www.pharo.org/) reference platform.

![](images/screenshot.png)

## Installation

1. Go to <https://platform.openai.com/account/api-keys> to set up an API key.
2. In a Playground, _Do it_:

```smalltalk
Metacello new 
  repository: 'github://brackendev/OpenAI-Pharo/src';
  baseline: 'OpenAI';
  load.
```

## Example Usage

```smalltalk
| chat |"Programatically use an OpenAI chat session."chat := OpenAIChat startWithSDK: (OpenAISDK createWithAPIKey: 'API_KEY').chat submitSystemPrompt: 'You are a chatbot named OMM 0000.'.chat submitUserPrompt: 'Who are you?'.chat lastChat. "I am OMM 0000, a language model AI chatbot..."chat submitUserPrompt: 'Who created you?'.chat lastChat. "I was created by OpenAI..."```

```smalltalk
"A GUI for an OpenAI chat session.""/export - Export the chat to a JSON file""/system A new system prompt"OpenAIChatGUI openWithSDK: (OpenAISDK createWithAPIKey: 'API_KEY').
```

```smalltalk
"A GUI for a generating images with OpenAI.""/export - Export the image to a PNG file""/imagesize '256x256' or '512x512' or '1024x1024'"OpenAIImageGUI openWithSDK: (OpenAISDK createWithAPIKey: 'API_KEY').
```

```smalltalk
"Update any class comment with the Class Responsibility Collaborator that OpenAI creates (based on the class definition and source code)."AnyClassYouWant updateCommentWithOpenAICRCWithSDK: (OpenAISDK createWithAPIKey: 'API_KEY').
```

## Author

Bracken Spencer

* [GitHub](https://www.github.com/brackendev)
* [LinkedIn](https://www.linkedin.com/in/brackenspencer/)
* [Twitter](https://twitter.com/brackendev)

## License

OpenAI-Pharo is released under the MIT license. See the LICENSE file for more info.
