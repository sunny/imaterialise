require "rest_client"

module Imaterialise
  module API
    class Error < StandardError
    end

    class APIError < Error
      def initialize(http_code, body)
        json = JSON.parse(body)
        error = json && json["error"]
        if error
          super "#{http_code}: #{error["message"]} (code #{error["code"]})"
        else
          super "#{http_code}: #{body}"
        end
      end
    end

    module_function

    def host
      if Imaterialise.configuration.sandbox
        "https://imatsandbox.materialise.net"
      else
        "https://i.materialise.com"
      end
    end
  end
end
