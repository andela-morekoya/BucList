require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  include Messages
  describe '#create' do
    context 'with valid params' do
      let(:valid_params) { FactoryGirl.attributes_for(:user) }
      it 'logs in user' do
        process :create, method: :post, params: valid_params

        expect(response).to have_http_status :ok
      end

      it 'generates a token for the user' do
        process :create, method: :post, params: valid_params

        expect(User.last.token).to be_present
      end
    end

    context 'with invalid params' do
      it 'gives error saying why resource could not created' do
        process :create, method: :post, params: { user: { email: 'invalid' } }

        expect(response).to have_http_status :unprocessable_entity
        expect(json[:errors]).to be_present
      end
    end
  end
end
