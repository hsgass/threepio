require 'json'
require 'json/add/core'

class GoogleTranslation

  def initialize(json_string)
    json = JSON.parse json_string
    @translations = json['data']['translations']
  end

  def to_s
    @translations[0]['translatedText']
  end

end

#+{
#         + "data": {
#         +  "translations": [
#                  +   {
#         +    "translatedText": "hola",
#                +    "detectedSourceLanguage": "en"
#                     +   }
#                  +  ]
#             + }
#         +}

