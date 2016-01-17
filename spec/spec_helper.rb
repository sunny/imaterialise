require "webmock/rspec"

# Cut off the interwebs
WebMock.disable_net_connect!(allow_localhost: true)


require "imaterialise"

Imaterialise.configure do |c|
  c.api_code = "test-api-code"
  c.tool_id = "test-tool-id"
  c.sandbox = true
end
