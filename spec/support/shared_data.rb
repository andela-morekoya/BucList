shared_context 'variables' do
  let!(:list) { FactoryGirl.create(:bucketlist) }

  let(:other_list) { FactoryGirl.create(:bucketlist) }

  before { list.user.generate_token }

  let(:header) { { 'AUTHORIZATION' => "#{list.user.token.token}" } }

  let(:invalid_params) { { name: '' } }
end
