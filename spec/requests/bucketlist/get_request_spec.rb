require 'rails_helper'

RSpec.describe 'Bucketlists', type: :request do
  include_context 'variables'

  describe 'GET /bucketlists' do
    it_behaves_like 'a successful get' do
      let(:expected_result) { list.user.bucketlists }

      before { get api_bucketlists_path, headers: header }
    end

    it_behaves_like 'the token is invalid' do
      before { get api_bucketlists_path }
    end
  end

  describe 'GET /bucketlists/<id>' do
    it_behaves_like 'a successful get' do
      let(:expected_result) { list }

      before { get "/api/bucketlists/#{list.id}", headers: header }
    end

    it_behaves_like 'the token is invalid' do
      before { get api_bucketlists_path }
    end
  end

  describe 'GET /bucketlists?q=query' do
    context 'with query in name of a bucketlist' do
      it 'returns the bucketlist with the query in its name' do
        query = list.name.split[0]
        get "/api/bucketlists/#{list.id}?q=#{query}", headers: header

        expect(json[:name]).to include query
      end
    end

    context 'with query not in any name of a bucketlist' do
      it 'returns an empty array' do
        get '/api/bucketlists?q=random', headers: header

        expect(json).to be_empty
      end
    end
  end

  describe 'GET /bucketlists?page=#&limit=#' do
    before do
      21.times { FactoryGirl.create(:bucketlist, user_id: list.user.id) }
    end

    context 'with only page parameter specified' do
      it 'returns all bucketlists starting from the specified page' do
        get '/api/bucketlists?page=2', headers: header

        expect(response.body).to_not include Bucketlist.first.name
        expect(response.body).to include Bucketlist.last.name
      end
    end

    context 'with only limit parameter specified' do
      it 'returns results with size limited by specified limit' do
        get '/api/bucketlists?limit=10', headers: header

        expect(response.body).to include Bucketlist.first.name
        expect(response.body).to_not include Bucketlist.last.name
        expect(json.size).to eq 10
      end
    end
  end
end
