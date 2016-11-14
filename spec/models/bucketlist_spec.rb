require 'rails_helper'

RSpec.describe Bucketlist, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:items).dependent(:destroy) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :name }
  end

  describe '.search' do
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

  describe '.paginate' do
    before { 101.times { FactoryGirl.create(:bucketlist) } }

    context 'with only limit query present' do
      context 'and limit query greater than maximum allowed' do
        it 'lists all bucketlists limited by the maximum allowed size' do
          params = { limit: '150' }
          result = Bucketlist.paginate(params[:limit], params[:page])

          expect(result.count).to eq 100
        end
      end

      context 'and limit query less than maximum allowed' do
        it 'lists all bucketlists limited by the maximum allowed size' do
          params = { limit: '50' }
          result = Bucketlist.paginate(params[:limit], params[:page])

          expect(result.count).to eq 50
        end
      end
    end

    context 'with only page params present' do
      it 'lists all bucketlists starting from specified page' do
        params = { page: '2' }
        result = Bucketlist.paginate(params[:limit], params[:page])

        expect(result.first[:name]).to eq Bucketlist.find(21).name
      end
    end
  end
end
