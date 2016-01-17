require "imaterialise/api/connection"

module Imaterialise
  # Represents a 3D Print Lab Connection between a model and imaterialise.
  #
  # See README.md for usage.
  class Connection
    attr_reader :file_url, :currency, :url

    def initialize(file_url:, currency:)
      @file_url = file_url
      @currency = currency
    end

    def upload
      result = API::Connection.post(self)
      @url = result.fetch(:url)
    end
  end
end
