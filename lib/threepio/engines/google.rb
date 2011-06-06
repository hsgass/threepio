require 'rest_client'

module Threepio
  module Engines
    module Google
      extend self

      URL = "https://www.googleapis.com/language/translate/v2?"

      attr_accessor :api_key

      def translate(phrase, params = {})
        # add error trapping for missing api_key, to, etc
        url = "#{URL}key=#{@api_key}&target=#{params[:to]}&q=#{phrase}"
        data = RestClient.get url
        JSON.parse(data)["data"]["translations"].first["translatedText"]
      end

    end
  end
end
