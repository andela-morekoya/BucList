require 'rails_helper'

RSpec.describe 'Bucketlists', type: :request do
  include Messages
  context 'when valid authorization token is sent' do
    let!(:list) { FactoryGirl.create(:bucketlist) }

    before { list.user.generate_token }

    let(:header) { { 'AUTHORIZATION' => "#{list.user.token.token}" } }

    let(:invalid_params) { { name: '' } }

    describe 'GET /bucketlists' do
      it 'lists all the created bucket lists' do
        get api_bucketlists_path, headers: header

        result = JSON.parse(ActiveModelSerializers::SerializableResource
            .new(Bucketlist.all, {}).to_json, symbolize_names: true)

        expect(response).to have_http_status(:ok)
        expect(json).to eq result
      end
    end

    describe 'POST /bucketlists' do
      context 'with valid params' do
        it 'creates a new bucket list' do
          post api_bucketlists_path,
               params: { name: 'New List' },
               headers: header

          expect(response).to have_http_status(:created)
          expect(json[:name]).to eq 'New List'
        end
      end

      context 'with invalid params' do
        it 'returns status code :bad_request' do
          post api_bucketlists_path,
               params: invalid_params,
               headers: header

          expect(response).to have_http_status(:bad_request)
          expect(json[:errors]).to eq not_created('Bucketlist')
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
                  params: { name: 'Changed List' },
                  headers: header

            expect(response).to have_http_status(:ok)
            expect(json[:name]).to eq 'Changed List'
          end
        end

        context 'with invalid params' do
          it 'returns status code :bad_request' do
            patch "/api/bucketlists/#{list.id}",
                  params: invalid_params,
                  headers: header

            expect(response).to have_http_status(:bad_request)
            expect(json[:errors]).to eq not_updated('Bucketlist')
          end
        end
      end

      context 'When user does not own the bucketlist' do
        it 'returns forbidden status' do
          other_user_list = FactoryGirl.create(:bucketlist)
          patch "/api/bucketlists/#{other_user_list.id}",
                params: { name: 'Changed List' },
                headers: header

          expect(response).to have_http_status(:forbidden)
          expect(json[:errors]).to eq no_access
        end
      end
    end

    describe 'DELETE /bucketlists/<id>' do
      context 'When user owns the bucketlist' do
        it 'deletes the specified bucket list' do
          delete "/api/bucketlists/#{list.id}",
                 params: { id: 1 }, headers: header

          expect(response).to have_http_status(:no_content)
          expect(Bucketlist.find_by(id: list.id)).to eq nil
        end
      end
      context 'When user does not own the bucketlist' do
        it 'returns forbidden status' do
          other_user_list = FactoryGirl.create(:bucketlist)
          delete "/api/bucketlists/#{other_user_list.id}",
                 params: { id: 1 }, headers: header

          expect(response).to have_http_status(:forbidden)
          expect(json[:errors]).to eq no_access
        end
      end
    end
  end
end
