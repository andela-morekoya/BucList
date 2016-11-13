require 'rails_helper'

RSpec.describe 'Items', type: :request do
  include_context 'variables'

  let!(:item) { list.items.create(FactoryGirl.attributes_for(:item)) }

  describe 'PUT /bucketlists/<bucketlist_id>/items/<id>' do
    it_behaves_like 'a successful update' do
      let(:new_name) { 'Changed List' }
      before do
        put "/api/bucketlists/#{list.id}/items/#{item.id}",
            params: { name: new_name },
            headers: header
      end
    end

    it_behaves_like 'the params are invalid' do
      before do
        put "/api/bucketlists/#{list.id}/items/#{item.id}",
            params: invalid_params,
            headers: header
      end
    end

    it_behaves_like 'the token is invalid' do
      before { put "/api/bucketlists/#{list.id}/items/#{item.id}" }
    end

    context 'when bucketlist belongs to another user' do
      it_behaves_like 'a forbidden action' do
        before do
          put "/api/bucketlists/#{other_list.id}/items/#{item.id}",
              params: { name: 'Changed List' },
              headers: header
        end
      end
    end
  end
end
