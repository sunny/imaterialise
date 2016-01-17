require "spec_helper"

module Imaterialise
  module API
    describe Connection do
      let(:connection) {
        Imaterialise::Connection.new(file_url: "http://example.com/foo.stl",
                                     currency: "eur")
      }

      describe ".post" do
        subject { described_class.post(connection) }

        it "returns a hash" do
          expected_body = {
            "currency" => "EUR",
            "fileUrl" => "http://example.com/foo.stl",
            "forceEmbedding" => "false",
            "plugin" => "test-tool-id",
            "useAjax" => "true",
          }
          expected_headers = {
            "Accept" => "application/json",
          }
          response_headers = {
            "Location" => "http://i.materialise.com/foo.stl",
          }

          stub_request(:post, "https://imatsandbox.materialise.net/upload")
            .with(body: expected_body, headers: expected_headers)
            .to_return(status: 302, headers: response_headers)

          expect(subject).to eq(url: "http://i.materialise.com/foo.stl")
        end
      end
    end
  end
end
