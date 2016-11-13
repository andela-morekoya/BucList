require 'rails_helper'

RSpec.describe 'Items', type: :request do
  include_context 'variables'

  let!(:item) { list.items.create(FactoryGirl.attributes_for(:item)) }

  describe 'POST /bucketlists/<bucketlist_id>/items' do
    it_behaves_like 'a successful create' do
      let(:new_name) { 'something new' }

      before do
        post "/api/bucketlists/#{list.id}/items",
             params: { name: new_name },
             headers: header
      end
    end

    it_behaves_like 'the params are invalid' do
      before do
        post "/api/bucketlists/#{list.id}/items",
             params: invalid_params,
             headers: header
      end
    end
  end
end
