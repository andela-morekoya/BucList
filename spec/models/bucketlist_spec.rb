require 'rails_helper'

RSpec.describe Bucketlist, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:user).dependent(:destroy) }
    it { is_expected.to have_many :items }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :name }
  end

  describe 'search' do
    let(:dream) { FactoryGirl.create(:bucketlist, name: 'My life dreams') }

    context 'when query is in bucketlist' do
      it 'returns the list of bucketlists matching the query supplied' do
        expect(Bucketlist.search('dream')).to eq [dream]
      end
    end

    context 'when query is not in bucketlist' do
      it 'returns an empty array' do
        expect(Bucketlist.search('hope')).to eq []
      end
    end
  end

  describe 'search_and_paginate' do
    before { 25.times { FactoryGirl.create(:bucketlist) } }

    context 'when paginate is specified without limit' do
      it 'lists the first 20 results' do
        result = Bucketlist.search_and_paginate

        expect(result.first[:name]).to eq Bucketlist.first.name
        expect(result).to_not include Bucketlist.last.name
      end
    end
  end
end
