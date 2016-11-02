require 'rails_helper'

RSpec.describe "Items", type: :request do
  let(:list) { FactoryGirl.build(:item) }

  before do
    FactoryGirl.build(:item)
  end

  describe "GET /bucketlists/<id>/items" do
    it "gets all items in specified bucket list" do
      get api_bucketlist_item_path, bucketlist_id: 1
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /bucketlists/<id>/items" do
    it "creates an item in specified bucket list" do
      post api_bucketlist_items_path, name: 1ist.name
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /bucketlists/<id>/items/<id>" do
    it "gets a single item in specified bucket list" do
      get api_bucketlist_item_path, bucketlist_id: 1, id: 1
      expect(response).to have_http_status(200)
    end
  end

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
    end
  end
end
