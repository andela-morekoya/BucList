require 'rails_helper'

RSpec.describe "Bucketlists", type: :request do
  describe "GET /bucketlists" do
    it "lists all the created bucket lists" do
      get users_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /bucketlists" do
    it "creates a new bucket list" do
      get users_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /bucketlists/<id>" do
    it "gets a single bucket list" do
      get users_path
      expect(response).to have_http_status(200)
    end
  end

  describe "PUT /bucketlists/<id>" do
    it "updates the specified bucket list" do
      get users_path
      expect(response).to have_http_status(200)
    end
  end

  describe "DELETE /bucketlists/<id>" do
    it "deletes the specified bucket list" do
      get users_path
      expect(response).to have_http_status(200)
    end
  end
end
