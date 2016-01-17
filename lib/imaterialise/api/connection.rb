require "imaterialise/api"

module Imaterialise
  module API
    # 3D Print Lab Connection API
    # See http://i.materialise.com/api/docs/3d-print-lab-connection-api/
    module Connection
      module_function

      def post(model)
        url = "#{API.host}/upload"
        body = post_body(model)

        RestClient.post(url, body, accept: :json) do |response, _, _|
          case response.code
          when 302
            { url: response.headers[:location] }
          else
            fail APIError.new(response.code, response.body)
          end
        end
      end

      def post_body(model)
        {
          useAjax: true,
          forceEmbedding: false,
          plugin: Imaterialise.configuration.tool_id,
          fileUrl: model.file_url,
          currency: model.currency.upcase,
        }
      end
    end
  end
end
