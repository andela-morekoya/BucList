require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  describe '#create' do
    context 'with valid params' do
      let(:valid_params) { FactoryGirl.attributes_for(:user) }
      it 'renders the details of resource created' do
        process :create, method: :post, params: valid_params

        user_response = JSON.parse(response.body)
        expect(user_response['email']).to eq valid_params[:email]
      end
    end

    context 'with invalid params' do
      it 'renders error saying why resource could not created' do
        process :create, method: :post, params: { user: { email: 'invalid' } }

        expect(response).to have_http_status :unprocessable_entity
      end
    end
  end
end
