require 'rails_helper'

RSpec.describe Token, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to :user }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :token }
    it { is_expected.to validate_uniqueness_of :token }
  end

  let!(:user) { FactoryGirl.create(:user) }
  before { user.generate_token }

  describe '#expired?' do
    subject { user.token.expired? }

    context 'when token has not expired' do
      it 'returns a false value' do
        expect(subject).to be false
      end
    end

    context 'when token is has expired' do
      it 'returns a true value' do
        user.token.update(expires_at: 3.hours.ago)

        expect(subject).to be true
      end
    end
  end

  describe 'token_user_id' do
    context 'when given a token' do
      it 'returns the user id of the token' do
        token = user.token.token

        result = Token.token_user_id(token)

        expect(result).to eq user.id
      end
    end
  end
end
