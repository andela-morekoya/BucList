require 'rails_helper'

RSpec.describe Token, type: :model do
  describe "Associations" do
    it { is_expected.to belong_to :user }
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of :token }
    it { is_expected.to validate_uniqueness_of :token }
  end

  let!(:user) { FactoryGirl.create(:user) }
  before { user.generate_token }

  describe "#is_valid" do
    subject { user.token.is_valid  }

    context "when token is has not expired" do
      it "returns a true value" do
        expect(subject).to be true
      end
    end

    context "when token is has expired" do
      it "returns a false value" do
        user.token.update(expires_at: 3.hours.ago)

        expect(subject).to be false
      end
    end
  end

  describe "get_user_id" do
    context "when given a token" do
      it "returns the user id of the token" do
        token = user.token.token
        
        result = Token.get_user_id(token)

        expect(result).to eq user.id
      end
    end
  end
end
