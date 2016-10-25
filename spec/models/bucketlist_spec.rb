require 'rails_helper'

RSpec.describe Bucketlist, type: :model do
  describe "Associations" do
    it { is_expected.to belong_to(:user).dependent(:destroy) }
    it { is_expected.to have_many :items }
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of :name }
  end


end
