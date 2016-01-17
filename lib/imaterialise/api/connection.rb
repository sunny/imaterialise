require "imaterialise/api"

module Imaterialise
  module API
    # 3D Print Lab Connection API
    # See http://i.materialise.com/api/docs/3d-print-lab-connection-api/
    module Connection
      module_function

      def post(model)
        url = "#{API.host}/upload"

        body = {
          useAjax: true,
          forceEmbedding: false,
          plugin: Imaterialise.configuration.tool_id,
          fileUrl: model.file_url,
          currency: model.currency.upcase,
        }

        headers = {
          accept: :json
        }

        RestClient.post(url, body, headers) do |response, _request, _result|
          case response.code
          when 302
            { url: response.headers[:location] }
          else
            fail APIError.new(response.code, response.body)
          end
        end
      end
    end
  end
end
