FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password 'correct'
  end
end
