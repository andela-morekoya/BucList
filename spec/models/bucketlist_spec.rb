require 'rails_helper'

RSpec.describe Bucketlist, type: :model do
<<<<<<< HEAD
<<<<<<< HEAD
  describe 'Associations' do
=======
  describe "Associations" do
>>>>>>> add destroy depndency
    it { is_expected.to belong_to(:user).dependent(:destroy) }
    it { is_expected.to have_many :items }
  end

<<<<<<< HEAD
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
=======
  pending "add some examples to (or delete) #{__FILE__}"
>>>>>>> create bucketlist models
=======
  describe "Validations" do
    it { is_expected.to validate_presence_of :name }
  end


>>>>>>> add destroy depndency
end
