RSpec.describe 'Invalid enpoint', type: :request do
  include Messages
  include_context 'variables'

  it 'tells the user the endpoint does not exist' do
    get "/api/bucket/#{list.id}", headers: header

    expect(json[:errors]).to eq no_route_found
  end
end
