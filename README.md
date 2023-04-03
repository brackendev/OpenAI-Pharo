OpenAI-Pharo
============

**A powerful [OpenAI](https://platform.openai.com/) playground.**

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
"Programatically use an OpenAI chat session."

sdk := (OpenAISDK createWithAPIKey: 'API_KEY').
chat := OpenAIChat startWithSDK: sdk.
chat submitSystemPrompt: 'You are a chatbot named OMM 0000.'.
chat submitUserPrompt: 'Who are you?'.
chat lastChat. "I am OMM 0000, a language model AI chatbot..."
chat submitUserPrompt: 'Who created you?'.
chat lastChat. "I was created by OpenAI..."
```

```smalltalk
"A GUI for an OpenAI chat session."
"/export - Export the chat to a JSON file"
"/system A new system prompt"

sdk := (OpenAISDK createWithAPIKey: 'API_KEY').
sdk model: 'gpt-4'. "Optional. Default is gpt-3.5-turbo"
OpenAIChatGUI openWithSDK: sdk.
```

```smalltalk
"A GUI for a generating images with OpenAI."
"/export - Export the image to a PNG file"
"/imagesize '256x256' or '512x512' or '1024x1024'"

sdk := (OpenAISDK createWithAPIKey: 'API_KEY').
OpenAIImageGUI openWithSDK: sdk.
```

```smalltalk
"Update any class comment with the Class Responsibility Collaborator that OpenAI creates (based on the class definition and source code)."

sdk := (OpenAISDK createWithAPIKey: 'API_KEY').
AnyClassYouWant updateCommentWithOpenAICRCWithSDK: sdk.
```

## Author

Bracken Spencer

* [GitHub](https://www.github.com/brackendev)
* [LinkedIn](https://www.linkedin.com/in/brackenspencer/)
* [Twitter](https://twitter.com/brackendev)

## License

OpenAI-Pharo is released under the MIT license. See the LICENSE file for more info.
