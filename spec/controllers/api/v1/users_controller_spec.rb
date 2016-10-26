require "rails_helper"

RSpec.describe Api::V1::UsersController, type: :controller do
  before { request.headers['Accept'] = "application/vnd.secchio.v1" }

  describe "GET #show" do
    let(:user) { FactoryGirl.create :user }

    before do
      get :show, params: { id: user.id }
    end

    it "returns the information about a reporter on a hash" do
      user_response = JSON.parse(response.body)
      expect(user_response["email"]).to eql user.email
    end

    it { is_expected.to respond_with 200 }
  end
end
# curl -H 'Accept: application/vnd.secchio.v1' http://localhost:3000/users/1
