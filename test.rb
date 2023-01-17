require_relative "lib/zakar.rb"

sus = Zakar::OpenAI.new("sk-your_api_key")
sus.GPT3("come va?")