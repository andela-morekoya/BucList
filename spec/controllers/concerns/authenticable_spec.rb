require 'rails_helper'

class Authentication
  include Authenticable
end

RSpec.describe Authenticable do
  let(:authentication) { Authentication.new }
  let(:user) { FactoryGirl.create :user }
  subject { authentication }

  describe "#current_user" do
    before do
      user.generate_token
      allow_any_instance_of(Authentication).to receive(:current_user)
      .and_return(user)
    end

    it "returns the user from the authorization header" do
      expect(authentication.current_user.token).to eql user.token
    end
  end

  describe "#authenticate_with_token" do
    before do
      allow_any_instance_of(Authentication).to receive(:current_user)
      .and_return(nil)
    end
    it "renders a json error message" do
      authentication.authenticate_with_token
      expect(json[:error]).to eq "Not authenticated"
    end
  end
end
