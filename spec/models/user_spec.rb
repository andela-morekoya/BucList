require 'rails_helper'

RSpec.describe User, type: :model do
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
=======
>>>>>>> write link model test
=======
>>>>>>> fix rubocop issues
  describe "Validations" do
=======
  describe 'Validations' do
>>>>>>> finish authentication implemantation
    subject { FactoryGirl.build(:user) }

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to allow_value('email@valid.com').for(:email) }
    it { is_expected.to_not allow_value('email@invalid').for(:email) }

    it { is_expected.to have_secure_password }
    it { is_expected.to validate_length_of(:password).is_at_least(6) }
  end

<<<<<<< HEAD
<<<<<<< HEAD
  # describe "Associations" do
  #   it { is_expected.to have_many(:bucketlists) }
  # end
<<<<<<< HEAD
>>>>>>> write user model tests
=======
=======
  
>>>>>>> write link model test
>>>>>>> write link model test
=======
  describe "Associations" do
=======
  describe 'Associations' do
>>>>>>> finish authentication implemantation
    it { is_expected.to have_many(:bucketlists) }
    it { is_expected.to have_one(:token) }
  end

<<<<<<< HEAD
<<<<<<< HEAD
  describe ".generate_token" do
    let (:user) { FactoryGirl.create(:user) }

    context "when token does not exist" do
      it "gives user a new token" do
        user.generate_token
        expect(user.token).to be_present
      end
    end

    context "when token already exists" do
      before { user.generate_token }
      context "and token has expired" do
        it "returns nil" do
          user.token.update(expires_at: 3.hours.ago)
          user.generate_token
          expect(user.token).to be nil
        end
      end

      context "and token has not expired" do
        it "returns the user's token" do
          result = user.generate_token
          expect(user.token).to eq result
        end
      end
    end
  end
<<<<<<< HEAD
>>>>>>> fix rubocop issues
=======

=======
>>>>>>> implement jwt
  describe "#generate_token" do
    it "generates a authentication token" do
=======
  describe '#generate_token' do
    it 'generates a authentication token' do
>>>>>>> finish authentication implemantation
      user = FactoryGirl.create(:user)
      user.generate_token
      expect(user.token).to_not be_nil
    end
  end
>>>>>>> write test for #generate_token in user
end
