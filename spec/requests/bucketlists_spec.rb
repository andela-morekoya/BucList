require 'rails_helper'

RSpec.describe 'Bucketlists', type: :request do
  context 'when valid authorization token is sent' do
    let!(:list) { FactoryGirl.create(:bucketlist) }

    before { list.user.generate_token }

    let(:header) do
      {
        'ACCEPT' => 'application/vnd.buclist.v1',
        'CONTENT-TYPE' => 'application/json',
        'AUTHORIZATION' => "#{list.user.token.token}"
      }
    end

    describe 'GET /bucketlists' do
      it 'lists all the created bucket lists' do
        get api_bucketlists_path, headers: header

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

          expect(response).to have_http_status(:bad_request)
        end
      end
    end

    describe 'GET /bucketlists/<id>' do
      it 'gets a single bucket list' do
        get "/api/bucketlists/#{list.id}", headers: header

        expect(response).to have_http_status(:ok)
      end
    end

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

          expect(response).to have_http_status(:forbidden)
        end
      end
    end

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

    describe 'DELETE /bucketlists/<id>' do
      it 'returns an unauthorized status' do
        delete "/api/bucketlists/#{list.id}",
               params: '{ "id": 1 }', headers: unauthorised_header

        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
