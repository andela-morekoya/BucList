require 'rails_helper'

class Authentication
  include Authenticable
end

RSpec.describe Authenticable do
  let(:authentication) { Authentication.new }
  let(:user) { FactoryGirl.create :user }
  subject { authentication }

  context 'When user has a valid token'
  before do
    user.generate_token
    allow_any_instance_of(Authentication).to receive(:http_header_token)
      .and_return(user.token.token)
  end

  describe '#current_user' do
    it 'returns the token\'s user' do
      expect(authentication.current_user.token).to eql user.token
    end
  end

  describe '#authenticate_request' do
    it 'ensures token in authorization header is valid' do
      authentication.authenticate_request
      expect(authentication.current_user).to be_present
    end
  end

  describe '#auth_token' do
    it 'gets the decoded token' do
      result = authentication.auth_token
      expect(result[:user]).to be_present
    end
  end

  describe '#http_header_token' do
    it 'returns a valid token' do
      result = authentication.http_header_token
      expect(result).to eq user.token.token
    end
  end
end
