require "rails_helper"

RSpec.describe Api::V1::AuthenticationController, type: :controller do
  let(:user) { FactoryGirl.create(:user, password: "correct") }

  let(:header) do
    {
      'ACCEPT' => 'application/vnd.secchio.v1',
      'CONTENT-TYPE' => 'application/json'
    }
  end

  before { request.headers = header }

  describe "#login" do
    context "with correct login details" do
      it "renders login page" do
        get :login, params: { }

        expect(json[:token]).to eq user.token
      end
    end

    context "with incorrect login details" do
      xit "renders login page" do
        get :new

        expect(response).to render_template "new"
      end
    end
  end

  describe "#logout" do
    context "with invalid details" do
      xit "should reject login" do
        post :create, session: { email: user.email, password: "wrong" }

        expect(flash[:alert]).to eq "Invalid email or password"
        expect(response).to redirect_to login_path
      end
    end

    context "with valid details" do
      xit "should reject login" do
        post :create, session: { email: user.email, password: "wrong" }

        expect(flash[:alert]).to eq "Invalid email or password"
        expect(response).to redirect_to login_path
      end
    end
end
