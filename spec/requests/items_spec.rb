require 'rails_helper'

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> fix rubocop issues
RSpec.describe 'Items', type: :request do
  let(:header) do
    {
      'ACCEPT' => 'application/vnd.buclist.v1',
      'CONTENT-TYPE' => 'application/json'
    }
  end

  let(:list) { FactoryGirl.create(:bucketlist) }

  let(:item) { FactoryGirl.create(:item, bucketlist_id: list.id) }

  describe 'GET /bucketlists/<id>/items' do
    it 'gets all items in specified bucket list' do
      get "/api/bucketlists/#{list.id}/items", headers: header

=======
RSpec.describe "Items", type: :request do
  let(:list) { FactoryGirl.build(:item) }

  before do
    FactoryGirl.build(:item)
  end

  describe "GET /bucketlists/<id>/items" do
    it "gets all items in specified bucket list" do
      get api_bucketlist_item_path, bucketlist_id: 1
>>>>>>> convert controller specs to feature tests
      expect(response).to have_http_status(200)
      expect(response.body).to eq ActiveModelSerializers::SerializableResource
        .new(list.items, {}).to_json
    end
  end

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> fix rubocop issues
  describe 'POST /bucketlists/<id>/items' do
    context 'with valid parameters' do
      it 'creates an item in specified bucket list' do
        post "/api/bucketlists/#{list.id}/items",
             params: '{ "item": { "name": "New item" } }', headers: header

        expect(response).to have_http_status(201)
        expect(json[:name]).to eq 'New item'
      end
    end

    context 'with invalid parameters' do
      it 'returns status 400' do
        post "/api/bucketlists/#{list.id}/items",
             params: '{ "item": { "name": "" } }', headers: header

        expect(response).to have_http_status(400)
      end
    end
  end

  describe 'GET /bucketlists/<id>/items/<id>' do
    it 'gets a single item in specified bucket list' do
      get "/api/bucketlists/#{list.id}/items/#{item.id}", headers: header

=======
  describe "POST /bucketlists/<id>/items" do
    it "creates an item in specified bucket list" do
      post api_bucketlist_items_path, name: 1ist.name
      expect(response).to have_http_status(200)
<<<<<<< HEAD
    end
  end

  describe "GET /bucketlists/<id>/items/<id>" do
    it "gets a single item in specified bucket list" do
      get api_bucketlist_item_path, bucketlist_id: 1, id: 1
>>>>>>> convert controller specs to feature tests
      expect(response).to have_http_status(200)
      expect(response.body).to eq ActiveModelSerializers::SerializableResource
        .new(item, {}).to_json
    end
  end

<<<<<<< HEAD
=======
      expect(response.body).to eq ActiveModelSerializers::SerializableResource
        .new(item, {}).to_json
    end
  end

>>>>>>> fix rubocop issues
  describe 'PUT /bucketlists/<id>/items/<id>' do
    context 'with valid parameters' do
      it 'updates a single item in specified bucket list' do
        put "/api/bucketlists/#{list.id}/items/#{item.id}",
            params: '{ "item": { "done": "true" } }', headers: header

        expect(response).to have_http_status(200)
        expect(json[:done]).to eq true
      end
    end

    context 'with invalid parameters' do
      it 'returns status 400' do
        put "/api/bucketlists/#{list.id}/items/#{item.id}",
            params: '{ "item": { "name": "" } }', headers: header

        expect(response).to have_http_status(400)
      end
    end
  end

  describe 'DELETE /bucketlists/<id>/items/<id>' do
    it 'deletes a single item in specified bucket list' do
      delete "/api/bucketlists/#{list.id}/items/#{item.id}", headers: header

      expect(response).to have_http_status(204)
=======
  describe "PUT /bucketlists/<id>/items/<id>" do
    it "updates a single item in specified bucket list" do
      put api_bucketlist_item_path, bucketlist_id: 1, id: 1, done: true
      expect(response).to have_http_status(200)
    end
  end

  describe "DELETE /bucketlists/<id>/items/<id>" do
    it "deletes a single item in specified bucket list" do
      delete api_bucketlist_item_path, bucketlist_id: 1, id: 1
      expect(response).to have_http_status(200)
>>>>>>> convert controller specs to feature tests
    end
  end
end
