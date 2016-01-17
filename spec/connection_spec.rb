require "spec_helper"

describe Imaterialise::Connection do
  subject {
    described_class.new(file_url: "http://example.com/foo.stl",
                        currency: "eur")
  }

  it "has a file url" do
    expect(subject.file_url).to eq("http://example.com/foo.stl")
  end

  it "has a currency" do
    expect(subject.currency).to eq("eur")
  end

  context "on upload" do
    let(:upload_response) { { url: "http://test" } }
    before do
      allow(Imaterialise::API::Connection).to receive(:post) { upload_response }
    end

    it { expect(subject.upload).to be_truthy }

    it "calls the API correctly" do
      subject.upload
      expect(Imaterialise::API::Connection).to have_received(:post)
        .with(subject)
    end

    it "sets the url" do
      subject.upload
      expect(subject.url).to eq("http://test")
    end
  end
end
