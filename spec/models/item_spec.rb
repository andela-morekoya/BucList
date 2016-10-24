require 'rails_helper'

RSpec.describe Item, type: :model do
<<<<<<< HEAD
  it { is_expected.to belong_to(:bucketlist).dependent(:destroy) }
  it { is_expected.to validate_presence_of :name }
=======
  pending "add some examples to (or delete) #{__FILE__}"
>>>>>>> create bucketlist models
end
