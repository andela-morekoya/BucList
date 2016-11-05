require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
  include Messages
  let(:user) { FactoryGirl.create(:user, password: 'correct') }

  describe '#login' do
    context 'with correct login details' do
      it "displays user's token" do
        credentials = { email: user.email, password: 'correct' }
        post '/api/auth/login', params: credentials

        expect(user.token).to be_present
        expect(json[:token][:token]).to eq user.token.token
      end
    end

    context 'with incorrect login details' do
      it 'lets user know that login failed' do
        credentials = { email: user.email, password: 'wrong' }
        post '/api/auth/login', params: credentials

        expect(json[:error]).to eq failed_login
        expect(response).to have_http_status :unauthorized
      end
    end
  end

  describe '#logout' do
    context 'with valid authentication token' do
      before { user.generate_token }

      let(:header) { { 'AUTHORIZATION' => "#{user.token.token}" } }

      it "should delete the user's token" do
        delete '/api/auth/logout', params: {}, headers: header
        user.reload

        expect(user.token).to be_nil
        expect(response).to have_http_status 204
      end
    end

    context 'with invalid authentication token' do
      let(:header) { { 'AUTHORIZATION' => 'invalid_authentication' } }

      it 'alerts user about invalid session' do
        delete '/api/auth/logout', params: {}, headers: header
        user.reload

        expect(json[:error]).to eq invalid_token
      end
    end

    context 'with no authentication token' do
      it 'alerts user about invalid session' do
        delete '/api/auth/logout', params: {}, headers: {}
        user.reload

        expect(json[:error]).to eq invalid_token
      end
    end
  end
end
