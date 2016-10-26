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
      let(:valid_params) { FactoryGirl.attributes_for(:user) }
      it "renders the details of resource created" do
      process :create, method: :post, params: { user: valid_params }

        user_response = JSON.parse(response.body)
        expect(user_response["email"]).to eq valid_params[:email]
      end
    end

    context "with invalid params" do
      it "renders error saying why resource could not created" do
        process :create, method: :post,  params: { user: { email: "invalid" } }

        user_response = JSON.parse(response.body)

        expect(user_response).to have_key("errors")
        expect(user_response["errors"]["email"][0]).to eq "is invalid"
      end
    end
  end

  describe "#update" do
    let(:user) { FactoryGirl.create(:user) }

    context "with valid params" do
      it "renders the details of resource updated" do
        new_email = "abc@valid.com"

        process :update, method: :patch, 
                         params: { id: user.id, user: { email: new_email} }

        user_response = JSON.parse(response.body)
        expect(user_response["email"]).to eq new_email
      end
    end

    context "with invalid params" do
      it "renders error saying why resource could not updated" do
        new_email = "abc@invalid"

        process :update, method: :patch, 
                         params: { id: user.id, user: { email: new_email } }

        user_response = JSON.parse(response.body)
        expect(user_response).to have_key("errors")
        expect(user_response["errors"]["email"][0]).to eq "is invalid"
      end
    end
  end

  
  describe "#delete" do
    it "deletes the specified user" do
      user = FactoryGirl.create(:user)
      
      process :delete, method: :destroy, params: { id: user.id }

      expect(User.find_by(id: user.id)).to be_nil
    end
  end
end 
