require 'rails_helper'

RSpec.describe 'Items', type: :request do
  include_context 'variables'

  let!(:item) { list.items.create(FactoryGirl.attributes_for(:item)) }

  describe 'GET /bucketlists/<bucketlist_id>/items' do
    it_behaves_like 'a successful get' do
      let(:array) { list.items }

      before do
        get "/api/bucketlists/#{list.id}/items", headers: header
      end
    end

    it_behaves_like 'the token is invalid' do
      before { get "/api/bucketlists/#{list.id}/items" }
    end
  end

  describe 'GET /bucketlists/<bucketlist_id>/items/<id>' do
    it_behaves_like 'a successful get' do
      let(:array) { item }

      before do
        get "/api/bucketlists/#{list.id}/items/#{item.id}", headers: header
      end
    end

    it_behaves_like 'the token is invalid' do
      before do
        get "/api/bucketlists/#{list.id}/items/#{item.id}"
      end
    end
  end
end
