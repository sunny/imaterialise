require "pry"
require "net-http-spy"
Net::HTTP.http_logger_options = { verbose: true }

require "imaterialise"

Imaterialise.configure do |c|
  c.api_code = "test-api-code"
  c.tool_id = "test-tool-id"
  c.sandbox = true
end
