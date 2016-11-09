require 'rails_helper'

RSpec.describe 'Items', type: :request do
  include Messages
  let!(:list) { FactoryGirl.create(:bucketlist) }

  let(:item) { FactoryGirl.create(:item, bucketlist_id: list.id) }

  before { list.user.generate_token }

  context 'when no authorization token is sent' do
    describe 'GET /bucketlists/<id>/items' do
      it 'returns an unauthorized status' do
        get "/api/bucketlists/#{list.id}/items"

        expect(response).to have_http_status(:unauthorized)
      end
    end

    describe 'POST /bucketlists/<id>/items' do
      it 'returns an unauthorized status' do
        post "/api/bucketlists/#{list.id}/items",
             params: '{ "name": "New item" }'

        expect(response).to have_http_status(:unauthorized)
      end
    end

    describe 'GET /bucketlists/<id>/items/<id>' do
      it 'returns an unauthorized status' do
        get "/api/bucketlists/#{list.id}/items/#{item.id}"

        expect(response).to have_http_status(:unauthorized)
      end
    end

    describe 'PUT /bucketlists/<id>/items/<id>' do
      it 'returns an unauthorized status' do
        put "/api/bucketlists/#{list.id}/items/#{item.id}",
            params: '{ "done": "true" }'

        expect(response).to have_http_status(:unauthorized)
      end
    end

    describe 'DELETE /bucketlists/<id>/items/<id>' do
      it 'returns an unauthorized status' do
        delete "/api/bucketlists/#{list.id}/items/#{item.id}"

        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
