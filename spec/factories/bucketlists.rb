FactoryGirl.define do
  factory :bucketlist do
    name { Faker::Lorem.sentence }
    user
  end
end
