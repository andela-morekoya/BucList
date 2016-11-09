require 'rails_helper'

RSpec.describe 'Bucketlists', type: :request do
  include Messages
  context 'when no authorization token is sent' do
    let!(:list) { FactoryGirl.create(:bucketlist) }

    describe 'GET /bucketlists' do
      it 'returns an unauthorized status' do
        get api_bucketlists_path

        expect(response).to have_http_status(:unauthorized)
        expect(json[:errors]).to eq invalid_token
      end
    end

    describe 'POST /bucketlists' do
      it 'returns an unauthorized status' do
        post api_bucketlists_path, params: { name: 'New List' }
        expect(response).to have_http_status(:unauthorized)
        expect(json[:errors]).to eq invalid_token
      end
    end

    describe 'GET /bucketlists/<id>' do
      it 'returns an unauthorized status' do
        get "/api/bucketlists/#{list.id}"

        expect(response).to have_http_status(:unauthorized)
        expect(json[:errors]).to eq invalid_token
      end
    end

    describe 'PUT /bucketlists/<id>' do
      it 'returns an unauthorized status' do
        patch "/api/bucketlists/#{list.id}", params: { name: 'Changed List' }

        expect(response).to have_http_status(:unauthorized)
        expect(json[:errors]).to eq invalid_token
      end
    end

    describe 'DELETE /bucketlists/<id>' do
      it 'returns an unauthorized status' do
        delete "/api/bucketlists/#{list.id}", params: { id: 1 }

        expect(response).to have_http_status(:unauthorized)
        expect(json[:errors]).to eq invalid_token
      end
    end
  end
end
