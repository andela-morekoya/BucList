require 'rails_helper'

RSpec.describe User, type: :model do
<<<<<<< HEAD
=======
  describe "Validations" do
    subject { FactoryGirl.build(:user) }

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to allow_value("email@valid.com").for(:email) }
    it { is_expected.to_not allow_value("email@invalid").for(:email) }

    it { is_expected.to have_secure_password }
    it { is_expected.to validate_length_of(:password).is_at_least(6) }
  end

  # describe "Associations" do
  #   it { is_expected.to have_many(:bucketlists) }
  # end
>>>>>>> write user model tests
end
