require "rails_helper"

RSpec.describe Api::V1::SessionsController, type: :controller do
  let(:user) { FactoryGirl.create(:user, password: "correct") }

  describe "#create" do
    context "with correct login details" do
      it "renders user's authentication token" do
        login_details = { email: user.email, password: "correct"}

        process :create, method: :post, params{ user: { login_details } } 

        expect(response.body).to include "token"
      end
    end
  end

  describe "#create" do
    context "with invalid details" do
      it "should reject login" do
        post :create, session: { email: user.email, password: "wrong" }

        expect(flash[:alert]).to eq "Invalid email or password"
        expect(response).to redirect_to login_path
      end
    end

    context "with valid details" do
      it "successfully logs in user" do
        post :create, session: { email: user.email, password: "correct" }

        expect(session[:user_id]).to_not be_nil
        expect(response).to redirect_to dashboard_path
      end
    end
  end

  describe "#delete" do
    it "logs out user" do
      post :destroy, session: { email: user.email, password: user.password }

      expect(session[:user_id]).to be_nil
      expect(response).to redirect_to root_path
    end
  end
end
# {"users":[{"email":"try@here.com","password":"unsecure"}]}
