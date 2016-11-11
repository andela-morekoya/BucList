shared_examples 'the token is invalid' do
  it "returns an unauthorized (401) status code" do
    expect(response).to have_http_status(:unauthorized)
  end

  it "displays an error" do
    expect(json[:errors]).to be_present
  end
end

shared_examples 'a successful get' do
  it "returns an OK (200) status code" do
    expect(response).to have_http_status(:ok)
  end

  it "lists the element(s) requested" do
    result = JSON.parse(ActiveModelSerializers::SerializableResource
          .new(array, {}).to_json, symbolize_names: true)
    
    expect(json).to eq result
  end
end

shared_examples 'the params are invalid' do
  it "returns a bad request (400) status code" do
    expect(response).to have_http_status(:bad_request)
  end

  it 'raises an error' do
    expect(json[:errors]).to be_present
  end
end

shared_examples 'a successful create' do
  it "returns a created (201) status code" do
    expect(response).to have_http_status(:created)
  end

  it "creates the element" do
    expect(json[:name]).to eq new_name
  end
end

shared_examples 'a successful update' do
  it "returns an OK (200) status code" do
    expect(response).to have_http_status(:ok)
  end

  it "updates the element" do
    expect(json[:name]).to eq new_name
  end
end

shared_examples 'a successful delete' do
  it "returns a no content (204) status code" do
    expect(response).to have_http_status(:no_content)
  end
end

shared_examples 'a forbidden action' do
  it "returns a forbidden (403) status code" do
    expect(response).to have_http_status(:forbidden)
  end

  it "tells the user what went wrong" do
    expect(json[:errors]).to be_present
  end
end




