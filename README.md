# Zakar

Zakar is a small, unofficial openAI API Wrapper for GPT-3 and DALL-E2.
Inspired by the greatest son of Allah named "Zakar".

#Installation
`sudo gem install zakar`

## Code examples

```rb
require 'zakar'

sus = Zakar::OpenAI.new("sk-your_api_key")
#GPT-3 Arguments: Description
sus.GPT3("how are you?") #==> ask a question

#Dall-E2 Arguments: Filename, description
sus.DallE2("amongus", "Sussy impostor") #==> ask to draw something
#Filename (amongus.jpg)
```
