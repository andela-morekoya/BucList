require 'rails_helper'

RSpec.describe "Items", type: :request do
  let(:header) { { 
    "ACCEPT" => "application/vnd.secchio.v1",
    "CONTENT-TYPE" => "application/json" 
  } }

  let(:list) { FactoryGirl.create(:bucketlist) }

  let(:item) { FactoryGirl.create(:item, bucketlist_id: list.id) }

  describe "GET /bucketlists/<id>/items" do
    it "gets all items in specified bucket list" do

      get "/api/bucketlists/#{list.id}/items", headers: header

      expect(response).to have_http_status(200)
      expect(response.body).to eq ActiveModelSerializers::SerializableResource.
        new(list.items, {}).to_json
    end
  end

  describe "POST /bucketlists/<id>/items" do
    it "creates an item in specified bucket list" do
      post "/api/bucketlists/#{list.id}/items", 
      params: '{ "item": { "name": "New item" } }', headers: header

      expect(response).to have_http_status(201)
      expect(json[:name]).to eq "New item"
    end
  end

  describe "GET /bucketlists/<id>/items/<id>" do
    it "gets a single item in specified bucket list" do
      get "/api/bucketlists/#{list.id}/items/#{item.id}", headers: header

      expect(response).to have_http_status(200)
      expect(json).to include item
    end
  end

  describe "PUT /bucketlists/<id>/items/<id>" do
    it "updates a single item in specified bucket list" do
      put "/api/bucketlists/#{list.id}/items/#{item.id}", 
      params: '{ "item": { "done": "true" } }', headers: header

      expect(response).to have_http_status(200)
      expect(json[:done]).to eq true
    end
  end

  describe "DELETE /bucketlists/<id>/items/<id>" do
    it "deletes a single item in specified bucket list" do
      delete "/api/bucketlists/#{list.id}/items/#{item.id}", headers: header

      expect(response).to have_http_status(204)
    end
  end
end
