require 'rails_helper'

RSpec.describe 'Items', type: :request do
  include_context 'variables'

  let!(:item) { list.items.create(FactoryGirl.attributes_for(:item)) } 

  describe 'DELETE /bucketlists/<bucketlist_id>/items/<id>' do
    it_behaves_like 'a successful delete' do
      before do 
        delete "/api/bucketlists/#{list.id}/items/#{item.id}", 
               headers: header
      end
    end

    context "when bucketlist belongs to another user" do
      it_behaves_like 'a forbidden action' do
        before do
          delete "/api/bucketlists/#{other_list.id}/items/#{item.id}", 
                 headers: header
        end
      end
    end

    it_behaves_like 'the token is invalid' do
      before { delete "/api/bucketlists/#{list.id}/items/#{item.id}" }
    end
  end
end
