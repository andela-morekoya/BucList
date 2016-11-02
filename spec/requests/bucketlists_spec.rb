require 'rails_helper'

<<<<<<< HEAD
RSpec.describe 'Bucketlists', type: :request do
  let(:header) do
    {
      'ACCEPT' => 'application/vnd.secchio.v1',
      'CONTENT-TYPE' => 'application/json'
    }
  end
=======
RSpec.describe "Bucketlists", type: :request do
  let(:header) { { 
    "ACCEPT" => "application/vnd.secchio.v1",
    "CONTENT-TYPE" => "application/json" 
  } }
>>>>>>> convert controller specs to feature tests

  let(:list) { FactoryGirl.create(:bucketlist) }

  # Add contexts for logged and not logged in

<<<<<<< HEAD
  describe 'GET /bucketlists' do
    it 'lists all the created bucket lists' do
      get api_bucketlists_path

      expect(response).to have_http_status(200)
      expect(response.body).to eq ActiveModelSerializers::SerializableResource
        .new(Bucketlist.all, {}).to_json
    end
  end

  describe 'POST /bucketlists' do
    context 'with valid params' do
      it 'creates a new bucket list' do
        post api_bucketlists_path,
             params: '{ "bucketlist": { "name": "New List" } }',
             headers: header

        expect(response).to have_http_status(201)
        expect(json[:name]).to eq 'New List'
      end
    end

    context 'with invalid params' do
      it 'returns status code 400' do
        post api_bucketlists_path,
             params: '{ "bucketlist": { "name": "" } }',
             headers: header

=======
  describe "GET /bucketlists" do
    it "lists all the created bucket lists" do
      get api_bucketlists_path
      
      expect(response).to have_http_status(200)
      expect(response.body).to eq ActiveModelSerializers::SerializableResource.
        new(Bucketlist.all, {}).to_json
    end
  end

  describe "POST /bucketlists" do
    context "with valid params" do
      it "creates a new bucket list" do
        post api_bucketlists_path, 
          params: '{ "bucketlist": { "name": "New List" } }', 
          headers: header
        
        expect(response).to have_http_status(201)
        expect(json[:name]).to eq "New List"
      end
    end

    context "with invalid params" do
      it "returns status code 400" do
        post api_bucketlists_path, 
          params: '{ "bucketlist": { "name": "" } }', 
          headers: header
        
>>>>>>> convert controller specs to feature tests
        expect(response).to have_http_status(400)
      end
    end
  end

<<<<<<< HEAD
  describe 'GET /bucketlists/<id>' do
    it 'gets a single bucket list' do
=======
  describe "GET /bucketlists/<id>" do
    it "gets a single bucket list" do
>>>>>>> convert controller specs to feature tests
      get "/api/bucketlists/#{list.id}", headers: header
      # get api_bucketlist_path, params: '{ "id": 1 }', headers: header
      expect(response).to have_http_status(200)
    end
  end

<<<<<<< HEAD
  describe 'PUT /bucketlists/<id>' do
    context 'with valid params' do
      it 'updates the specified bucket list' do
        patch "/api/bucketlists/#{list.id}",
              params: '{ "bucketlist": { "name": "Changed List" } }',
              headers: header

        expect(response).to have_http_status(200)
        expect(Bucketlist.find(list.id).name).to eq 'Changed List'
      end
    end

    context 'with invalid params' do
      it 'returns status code 400' do
        patch "/api/bucketlists/#{list.id}",
              params: '{ "bucketlist": { "name": "" } }',
              headers: header
=======
  describe "PUT /bucketlists/<id>" do
    context "with valid params" do
      it "updates the specified bucket list" do
        patch "/api/bucketlists/#{list.id}", 
          params: '{ "bucketlist": { "name": "Changed List" } }', 
          headers: header

        expect(response).to have_http_status(200)
        expect(Bucketlist.find(list.id).name).to eq "Changed List"
      end
    end

    context "with invalid params" do
      it "returns status code 400" do
        patch "/api/bucketlists/#{list.id}", 
          params: '{ "bucketlist": { "name": "" } }', 
          headers: header
>>>>>>> convert controller specs to feature tests

        expect(response).to have_http_status(400)
      end
    end
  end

<<<<<<< HEAD
  describe 'DELETE /bucketlists/<id>' do
    it 'deletes the specified bucket list' do
      delete "/api/bucketlists/#{list.id}",
             params: '{ "id": 1 }', headers: header
=======
  describe "DELETE /bucketlists/<id>" do
    it "deletes the specified bucket list" do
      delete "/api/bucketlists/#{list.id}", params: '{ "id": 1 }', headers: header
>>>>>>> convert controller specs to feature tests

      expect(response).to have_http_status(204)
      expect(Bucketlist.find_by(id: list.id)).to eq nil
    end
  end
end
