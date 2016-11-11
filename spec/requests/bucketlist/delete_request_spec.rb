require 'rails_helper'

RSpec.describe 'Bucketlists', type: :request do
  include_context 'variables'

  describe 'DELETE /bucketlists/<id>' do
    it_behaves_like 'a successful delete' do
      before { delete "/api/bucketlists/#{list.id}", headers: header }
    end

    context "when bucketlist belongs to another user" do
      it_behaves_like 'a forbidden action' do
        before { delete "/api/bucketlists/#{other_list.id}", headers: header }
      end
    end

    it_behaves_like 'the token is invalid' do
      before { delete "/api/bucketlists/#{list.id}" }
    end
  end
end
