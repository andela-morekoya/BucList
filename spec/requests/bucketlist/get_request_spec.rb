require 'rails_helper'

RSpec.describe 'Bucketlists', type: :request do
  include_context 'variables'

  describe 'GET /bucketlists' do 
    it_behaves_like 'a successful get' do
      let(:array) { list.user.bucketlists }

      before { get api_bucketlists_path, headers: header }
    end

    it_behaves_like 'the token is invalid' do
      before { get api_bucketlists_path }
    end
  end

  describe 'GET /bucketlists/<id>' do
    it_behaves_like 'a successful get' do
      let(:array) { list }

      before { get "/api/bucketlists/#{list.id}", headers: header }
    end

    it_behaves_like 'the token is invalid' do
      before { get api_bucketlists_path }
    end
  end
end
