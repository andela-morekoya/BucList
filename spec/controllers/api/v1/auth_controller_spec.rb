require "rails_helper"

RSpec.describe Api::V1::AuthController, type: :controller do
  let(:user) { FactoryGirl.create(:user, password: "correct") }

  let(:header) do
    {
      'ACCEPT' => 'application/vnd.buclist.v1',
      'CONTENT-TYPE' => 'application/json'
    }
  end

  describe "#login" do
    context "with correct login details" do
      it "displays user's token" do
        credentials = { email: user.email, password: "correct" }
        process :login, method: :post, params: { auth: credentials }

        expect(json[:token]).to eq user.token
      end
    end

    context "with incorrect login details" do
      it "lets user know that login failed" do
        credentials = { email: user.email, password: "wrong" }
        process :login, method: :post, params: { auth: credentials }

        expect(json[:error]).to eq "Login failed"
      end
    end
  end

  describe "#logout" do
    it "should delete the user's token" do
      credentials = { email: user.email, password: "correct" }
      process :login, method: :post, params: { auth: credentials }

      process :logout, method: :destroy, params: { auth: credentials }
      expect(user.token).to be_nil
      expecr(response).to have_http_status 204
    end
  end
end
