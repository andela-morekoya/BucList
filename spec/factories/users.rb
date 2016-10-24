FactoryGirl.define do
  factory :user do
<<<<<<< HEAD
    email { Faker::Internet.email }
=======
    email Faker::Internet.email
>>>>>>> get model tests to pass
    password Faker::Internet.password
  end
end
