require 'spec_helper'

describe Gemini::Client do
  include_context "api requests"

  context "malformed response JSON" do
    before do
      stub_http("/pubticker/btcusd","malformed json")
    end

    it { expect{ client.ticker }.to raise_error(Faraday::ParsingError) }
  end

  context "400 error" do
    before do
      stub_http("/pubticker/btcusd",{message: "error message 400"}.to_json,status: 400)
    end

    it { expect{ client.ticker }.to raise_error(Gemini::BadRequestError, "error message 400") }
  end

  context "401 error" do
    before do
      stub_http("/pubticker/btcusd",{message: "unauthorized 401"}.to_json,status: 401)
    end

    it { expect{ client.ticker }.to raise_error(Gemini::UnauthorizedError) }
  end

  context "403 error" do
    before do
      stub_http("/pubticker/btcusd",{message: "forbidden 403"}.to_json,status: 403)
    end

    it { expect{ client.ticker }.to raise_error(Gemini::ForbiddenError) }
  end

  context "404 error" do
    before do
      stub_http("/pubticker/btcusd",{message: "404 not found"}.to_json, status:404)
    end

    it { expect{ client.ticker }.to raise_error(Gemini::NotFoundError) }
  end


  context "500 error" do
    before do
      stub_http("/pubticker/btcusd",{message: "error message 500"}.to_json, status:500)
    end

    it { expect{ client.ticker }.to raise_error(Gemini::InternalServerError) }
  end

end
