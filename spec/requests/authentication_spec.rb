require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
  let(:user) { FactoryGirl.create(:user, password: 'correct') }

  describe '#login' do
    context 'with correct login details' do
      it "displays user's token" do
        credentials = { email: user.email, password: 'correct' }
        post :"/api/auth/login", params: { auth: credentials }

        expect(json[:token]).to eq user.token
      end
    end

    context 'with incorrect login details' do
      it 'lets user know that login failed' do
        credentials = { email: user.email, password: 'wrong' }
        post :"/api/auth/login", params: { auth: credentials }

        expect(json[:error]).to eq 'Login failed'
        expect(response).to have_http_status :unauthorized
      end
    end
  end

  describe '#logout' do
    before { user.generate_token }

    let(:header) do
      {
        'ACCEPT' => 'application/vnd.buclist.v1',
        'CONTENT-TYPE' => 'application/json',
        'AUTHORIZATION' => "#{user.token.token}"
      }
    end

    it "should delete the user's token" do
      delete '/api/auth/logout', params: {}, headers: header
      user.reload

      expect(user.token).to be_nil
      expect(response).to have_http_status 204
    end
  end
end
