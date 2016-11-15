require 'rails_helper'

RSpec.describe 'Registration', type: :request do
  include Messages

  describe 'POST /users' do
    context 'with valid params' do
      let(:valid_params) { FactoryGirl.attributes_for(:user) }

      before { post '/api/users', params: valid_params }

      it 'returns a created (201) status message' do
        expect(response).to have_http_status :created
      end

      it 'generates a token for the user' do
        expect(json[:token][:token]).to eq User.last.token.token
      end
    end

    context 'with invalid params' do
      before { post '/api/users', params: { user: { email: 'invalid' } } }

      it 'returns a unprocessable_entity (422) status message' do
        expect(response).to have_http_status :unprocessable_entity
      end

      it 'gives error saying why user could not created' do
        expect(json[:errors]).to be_present
      end
    end
  end
end
