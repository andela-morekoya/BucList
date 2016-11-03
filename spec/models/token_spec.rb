require 'rails_helper'

RSpec.describe Token, type: :model do
  describe "Associations" do
    it { is_expected.to belong_to :user }
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of :token }
    it { is_expected.to validate_uniqueness_of :token }
  end

  describe "#is_valid" do
    let!(:user) { FactoryGirl.create(:user) }

    before { user.generate_token }

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

  describe "#is_valid" do
    let(:user) { FactoryGirl.create(:user) }

    before do
      user.generate_token
    end

    it "checks that a token is still valid" do
      expect(user.token.is_valid).to be true
    end

    it "returns false when token is expired" do
      user.token.update(expires_at: 3.hours.ago)
      
      expect(user.token.is_valid).to be false
    end
  end
end
