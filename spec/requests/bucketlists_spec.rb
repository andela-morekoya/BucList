require 'rails_helper'

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> fix rubocop issues
RSpec.describe 'Bucketlists', type: :request do
<<<<<<< HEAD
<<<<<<< HEAD
  let(:header) do
    {
      'ACCEPT' => 'application/vnd.secchio.v1',
      'CONTENT-TYPE' => 'application/json'
    }
  end
<<<<<<< HEAD
=======
RSpec.describe "Bucketlists", type: :request do
  let(:header) { { 
    "ACCEPT" => "application/vnd.secchio.v1",
    "CONTENT-TYPE" => "application/json" 
  } }
>>>>>>> convert controller specs to feature tests
=======
>>>>>>> fix rubocop issues
=======
  context "When user is logged in with valid token" do
=======
  context 'when valid authorization token is sent' do
>>>>>>> finish authentication implemantation
    let!(:list) { FactoryGirl.create(:bucketlist) }
>>>>>>> fix authentication

    before { list.user.generate_token }

    let(:header) do
      {
        'ACCEPT' => 'application/vnd.buclist.v1',
        'CONTENT-TYPE' => 'application/json',
        'AUTHORIZATION' => "#{list.user.token.token}"
      }
    end

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  describe 'GET /bucketlists' do
    it 'lists all the created bucket lists' do
      get api_bucketlists_path
=======
    describe 'GET /bucketlists' do
      it 'lists all the created bucket lists' do
        get api_bucketlists_path, headers: header
>>>>>>> fix authentication

        expect(response).to have_http_status(:ok)
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

          expect(response).to have_http_status(:created)
          expect(json[:name]).to eq 'New List'
        end
      end

      context 'with invalid params' do
        it 'returns status code :bad_request' do
          post api_bucketlists_path,
               params: '{ "bucketlist": { "name": "" } }',
               headers: header

<<<<<<< HEAD
<<<<<<< HEAD
=======
  describe "GET /bucketlists" do
    it "lists all the created bucket lists" do
=======
  describe 'GET /bucketlists' do
    it 'lists all the created bucket lists' do
>>>>>>> fix rubocop issues
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

<<<<<<< HEAD
    context "with invalid params" do
      it "returns status code 400" do
        post api_bucketlists_path, 
          params: '{ "bucketlist": { "name": "" } }', 
          headers: header
        
>>>>>>> convert controller specs to feature tests
=======
    context 'with invalid params' do
      it 'returns status code 400' do
        post api_bucketlists_path,
             params: '{ "bucketlist": { "name": "" } }',
             headers: header

>>>>>>> fix rubocop issues
        expect(response).to have_http_status(400)
=======
          expect(response).to have_http_status(400)
=======
          expect(response).to have_http_status(:bad_request)
>>>>>>> finish authentication implemantation
        end
>>>>>>> fix authentication
      end
    end

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  describe 'GET /bucketlists/<id>' do
    it 'gets a single bucket list' do
=======
  describe "GET /bucketlists/<id>" do
    it "gets a single bucket list" do
>>>>>>> convert controller specs to feature tests
=======
  describe 'GET /bucketlists/<id>' do
    it 'gets a single bucket list' do
>>>>>>> fix rubocop issues
      get "/api/bucketlists/#{list.id}", headers: header
      expect(response).to have_http_status(200)
=======
    describe 'GET /bucketlists/<id>' do
      it 'gets a single bucket list' do
        get "/api/bucketlists/#{list.id}", headers: header

        expect(response).to have_http_status(:ok)
      end
>>>>>>> fix authentication
    end

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> fix rubocop issues
  describe 'PUT /bucketlists/<id>' do
    context 'with valid params' do
      it 'updates the specified bucket list' do
        patch "/api/bucketlists/#{list.id}",
              params: '{ "bucketlist": { "name": "Changed List" } }',
              headers: header
<<<<<<< HEAD

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
=======
>>>>>>> fix rubocop issues
=======
    describe 'PUT /bucketlists/<id>' do
      context 'when user owns the bucketlist' do
        context 'with valid params' do
          it 'updates the specified bucket list' do
            patch "/api/bucketlists/#{list.id}",
                  params: '{ "bucketlist": { "name": "Changed List" } }',
                  headers: header

            expect(response).to have_http_status(:ok)
            expect(Bucketlist.find(list.id).name).to eq 'Changed List'
          end
        end

        context 'with invalid params' do
          it 'returns status code :bad_request' do
            patch "/api/bucketlists/#{list.id}",
                  params: '{ "bucketlist": { "name": "" } }',
                  headers: header

            expect(response).to have_http_status(:bad_request)
          end
        end
      end

      context 'When user does not own the bucketlist' do
        it 'returns forbidden status' do
          other_user_list = FactoryGirl.create(:bucketlist)
          patch "/api/bucketlists/#{other_user_list.id}",
                params: '{ "bucketlist": { "name": "Changed List" } }',
                headers: header
>>>>>>> fix authentication

          expect(response).to have_http_status(:forbidden)
        end
      end
    end

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    context "with invalid params" do
      it "returns status code 400" do
        patch "/api/bucketlists/#{list.id}", 
          params: '{ "bucketlist": { "name": "" } }', 
          headers: header
>>>>>>> convert controller specs to feature tests
=======
    context 'with invalid params' do
      it 'returns status code 400' do
        patch "/api/bucketlists/#{list.id}",
              params: '{ "bucketlist": { "name": "" } }',
              headers: header
>>>>>>> fix rubocop issues
=======
      context 'with invalid params' do
        it 'returns status code 400' do
          patch "/api/bucketlists/#{list.id}",
                params: '{ "bucketlist": { "name": "" } }',
                headers: header
>>>>>>> fix authentication
=======
    describe 'DELETE /bucketlists/<id>' do
      context 'When user owns the bucketlist' do
        it 'deletes the specified bucket list' do
          delete "/api/bucketlists/#{list.id}",
                 params: '{ "id": 1 }', headers: header

          expect(response).to have_http_status(:no_content)
          expect(Bucketlist.find_by(id: list.id)).to eq nil
        end
      end
      context 'When user does not own the bucketlist' do
        it 'returns forbidden status' do
          other_user_list = FactoryGirl.create(:bucketlist)
          delete "/api/bucketlists/#{other_user_list.id}",
                 params: '{ "id": 1 }', headers: header
>>>>>>> finish authentication implemantation

          expect(response).to have_http_status(:forbidden)
        end
      end
    end
  end

  context 'when no authorization token is sent' do
    let!(:list) { FactoryGirl.create(:bucketlist) }

    let(:unauthorised_header) do
      {
        'ACCEPT' => 'application/vnd.buclist.v1',
        'CONTENT-TYPE' => 'application/json'
      }
    end

    describe 'GET /bucketlists' do
      it 'returns an unauthorized status' do
        get api_bucketlists_path, headers: unauthorised_header

        expect(response).to have_http_status(:unauthorized)
      end
    end

    describe 'POST /bucketlists' do
      it 'returns an unauthorized status' do
        post api_bucketlists_path,
             params: '{ "bucketlist": { "name": "New List" } }',
             headers: unauthorised_header

        expect(response).to have_http_status(:unauthorized)
      end
    end

    describe 'GET /bucketlists/<id>' do
      it 'returns an unauthorized status' do
        get "/api/bucketlists/#{list.id}", headers: unauthorised_header

        expect(response).to have_http_status(:unauthorized)
      end
    end

    describe 'PUT /bucketlists/<id>' do
      it 'returns an unauthorized status' do
        patch "/api/bucketlists/#{list.id}",
              params: '{ "bucketlist": { "name": "Changed List" } }',
              headers: unauthorised_header

        expect(response).to have_http_status(:unauthorized)
      end
    end

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> fix rubocop issues
  describe 'DELETE /bucketlists/<id>' do
    it 'deletes the specified bucket list' do
      delete "/api/bucketlists/#{list.id}",
             params: '{ "id": 1 }', headers: header
<<<<<<< HEAD
=======
  describe "DELETE /bucketlists/<id>" do
    it "deletes the specified bucket list" do
      delete "/api/bucketlists/#{list.id}", params: '{ "id": 1 }', headers: header
>>>>>>> convert controller specs to feature tests
=======
>>>>>>> fix rubocop issues
=======
    describe 'DELETE /bucketlists/<id>' do
      it 'returns an unauthorized status' do
        delete "/api/bucketlists/#{list.id}",
<<<<<<< HEAD
               params: '{ "id": 1 }', headers: header
>>>>>>> fix authentication
=======
               params: '{ "id": 1 }', headers: unauthorised_header
>>>>>>> finish authentication implemantation

        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
