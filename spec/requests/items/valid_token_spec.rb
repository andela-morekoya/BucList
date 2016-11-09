require 'rails_helper'

RSpec.describe 'Items', type: :request do
  include Messages
  let(:list) { FactoryGirl.create(:bucketlist) }

  let!(:item) { list.items.create(FactoryGirl.attributes_for(:item)) }

  before { list.user.generate_token }

  context ' when valid authorization token is sent' do
    let(:header) { { 'AUTHORIZATION' => "#{list.user.token.token}" } }

    describe 'GET /bucketlists/<bucketlist_id>/items' do
      it 'gets all items in specified bucket list' do
        get "/api/bucketlists/#{list.id}/items", headers: header

        result = JSON.parse(ActiveModelSerializers::SerializableResource
          .new(list.items, {}).to_json, symbolize_names: true)

        expect(response).to have_http_status(:ok)
        expect(json).to eq result
      end
    end

    describe 'POST /bucketlists/<bucketlist_id>/items' do
      context 'with valid parameters' do
        it 'creates an item in specified bucket list' do
          post "/api/bucketlists/#{list.id}/items",
               params: { name: 'New item' }, headers: header

          expect(response).to have_http_status(:created)
          expect(json[:name]).to eq 'New item'
        end
      end

      context 'with invalid parameters' do
        it 'returns status :bad_request' do
          post "/api/bucketlists/#{list.id}/items",
               params: { name: '' }, headers: header

          expect(response).to have_http_status(:bad_request)
          expect(json[:errors]).to eq not_created('Item')
        end
      end
    end

    describe 'GET /bucketlists/<bucketlist_id>/items/<id>' do
      it 'gets a single item in specified bucket list' do
        get "/api/bucketlists/#{list.id}/items/#{item.id}", headers: header

        result = JSON.parse(ActiveModelSerializers::SerializableResource
          .new(item, {}).to_json, symbolize_names: true)

        expect(response).to have_http_status(:ok)
        expect(json[:name]).to eq result[:name]
      end
    end

    describe 'PUT /bucketlists/<bucketlist_id>/items/<id>' do
      context 'with valid parameters' do
        it 'updates a single item in specified bucket list' do
          put "/api/bucketlists/#{list.id}/items/#{item.id}",
              params: { done: 'true' }, headers: header

          expect(response).to have_http_status(:ok)
          expect(json[:done]).to eq true
        end
      end

      context 'with invalid parameters' do
        it 'returns status :bad_request' do
          put "/api/bucketlists/#{list.id}/items/#{item.id}",
              params: { name: '' }, headers: header

          expect(response).to have_http_status(:bad_request)
          expect(json[:errors]).to eq not_updated('Item')
        end
      end
    end

    describe 'DELETE /bucketlists/<bucketlist_id>/items/<id>' do
      it 'deletes a single item in specified bucket list' do
        delete "/api/bucketlists/#{list.id}/items/#{item.id}", headers: header

        expect(response).to have_http_status(204)
      end
    end
  end
end
