module Imaterialise
  # Settings for the API.
  class Configuration
    attr_accessor :api_code
    attr_accessor :tool_id
    attr_accessor :sandbox

    def initialize
      @api_code = ""
      @tool_id = ""
      @sandbox = false
    end
  end

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end
end
