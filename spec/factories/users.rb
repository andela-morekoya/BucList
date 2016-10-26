FactoryGirl.define do
  factory :user do
<<<<<<< HEAD
<<<<<<< HEAD
    email { Faker::Internet.email }
=======
    email Faker::Internet.email
>>>>>>> get model tests to pass
    password Faker::Internet.password
=======
    email { Faker::Internet.email }
    password { Faker::Internet.password }
>>>>>>> write code for user#create
  end
end
