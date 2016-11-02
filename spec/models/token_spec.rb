require 'rails_helper'

RSpec.describe Token, type: :model do
  it { is_expected.to belong_to(:user).dependent(:destroy) }
  it { is_expected.to validate_presence_of :token }

  describe "#is_valid" do
    let!(:user) { FactoryGirl.create(:user) }

    subject { user.token.is_valid? }

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
end
