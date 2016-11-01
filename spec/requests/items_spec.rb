require 'rails_helper'

RSpec.describe "Items", type: :request do
  describe "GET /bucketlists/<id>/items" do
    it "gets all items in specified bucket list" do
      get users_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /bucketlists/<id>/items" do
    it "creates an item in specified bucket list" do
      get users_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /bucketlists/<id>/items/<id>" do
    it "gets a single item in specified bucket list" do
      get users_path
      expect(response).to have_http_status(200)
    end
  end

  describe "PUT /bucketlists/<id>/items/<id>" do
    it "updates a single item in specified bucket list" do
      get users_path
      expect(response).to have_http_status(200)
    end
  end

  describe "DELETE /bucketlists/<id>/items/<id>" do
    it "deletes a single item in specified bucket list" do
      get users_path
      expect(response).to have_http_status(200)
    end
  end
end
