require "rails_helper"

RSpec.describe Api::V1::UsersController, type: :controller do
  before { request.headers['Accept'] = "application/vnd.secchio.v1" }

  describe "#show" do
    let(:user) { FactoryGirl.create :user }

    before do
      get :show, params: { id: user.id }
    end

    it "returns the specified user's information on a hash" do
      user_response = JSON.parse(response.body)
      expect(user_response["email"]).to eql user.email
    end

    it { is_expected.to respond_with 200 }
  end

  describe "#create" do
    context "with valid params" do
      it "responds with 201 - resource created" do
        post :create, params: { user: FactoryGirl.attributes_for(:user) }
        is_expected.to respond_with 201
      end
    end

    context "with invalid params" do
      before { post :create, params: { email: "invalid" } }
      it "renders error saying why resource could not created" do
        user_response = JSON.parse(response.body)
        expect(user_response).to have_key(:errors)
        expect(user_response[:errors]).to be "ladida"
      end

      it "responds with 422 - Unprocessable entity" do
        is_expected.to respond_with 422
      end
    end
  end
end
# curl -H 'Accept: application/vnd.secchio.v1' http://localhost:3000/users/1
