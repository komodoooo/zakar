module Zakar
    require 'http'
    require 'json'
    DALLE2 = "https://api.openai.com/v1/images/generations"
    GPT3 = "https://api.openai.com/v1/engines/davinci/completions"
    class OpenAI
        def initialize(apikey)
            @apikey = apikey
            @headers = {
                "Content-Type"=> "application/json", 
                "Authorization"=> "Bearer #{apikey}"
           }
        end
        def DallE2(filename, description, size:"1024x1024")
            req = HTTP.post(DALLE2,:headers=>@headers,:body=>JSON({
                "prompt"=>description,
                "n"=>1,"size"=>size
            }))
            image = HTTP.get(JSON(req.body)["data"].to_s.match(/"url"=>"(.*)"/m)[1])
            a = File.new("#{filename}.jpg", "w")
            a.write(image.body)
            a.close()
        end
        def GPT3(description)
            req = HTTP.post(GPT3, :headers=>@headers, :body=>JSON({
                "prompt"=>description, "stop"=>nil,
                "n"=>1,"temperature"=>0.5,"max_tokens"=>100
            }))
            puts JSON(req.body)["choices"].to_s.match(/"text"=>"(.*)",/m).to_s.split('"text"=>"')[1].gsub('\n\n', "\n")
        end
    end
end
