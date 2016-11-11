require 'rails_helper'

RSpec.describe 'Bucketlists', type: :request do
  include_context 'variables'

  describe 'POST /bucketlists' do
    it_behaves_like 'a successful create' do
      let(:new_name) { 'New List' }

      before do
        post api_bucketlists_path,
        params: { name: new_name },
        headers: header
      end
    end

    it_behaves_like 'the params are invalid' do
      before do
        post api_bucketlists_path,
          params: invalid_params,
          headers: header
      end
    end
  end
end
