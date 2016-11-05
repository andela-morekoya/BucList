require 'rails_helper'

RSpec.describe Bucketlist, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:items).dependent(:destroy) }
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

  describe '.search_and_paginate' do
    before { 125.times { FactoryGirl.create(:bucketlist) } }

    context 'when no query is present' do
      it 'lists all bucketlists limited by the result default size' do
        result = Bucketlist.search_and_paginate

        expect(result.count).to eq 20
      end
    end

    context 'when only page or limit query is present' do
      context 'and limit query greater than maximum allowed' do
        it 'lists all bucketlists limited by the maximum allowed size' do
          result = Bucketlist.search_and_paginate(limit: 150)

          expect(result.count).to eq 100
        end
      end

      context 'and limit query less than maximum allowed' do
        it 'lists all bucketlists limited by the maximum allowed size' do
          params = { limit: 50 }
          result = Bucketlist.search_and_paginate(params)

          expect(result.count).to eq 50
        end
      end

      context 'and page params is valid' do
        it 'lists all bucketlists starting from specified page' do
          result = Bucketlist.search_and_paginate(page: 2)

          expect(result.first[:name]).to eq Bucketlist.find(21).name
        end
      end
    end
  end
end
