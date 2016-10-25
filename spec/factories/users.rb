FactoryGirl.define do
  factory :user do
<<<<<<< HEAD
<<<<<<< HEAD
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
=======
    email { Faker::Internet.email }
    password { Faker::Internet.password }
=======
    email Faker::Internet.email
    password Faker::Internet.password
>>>>>>> create bucketlist models
>>>>>>> create bucketlist models
=======
    email { Faker::Internet.email }
    password { Faker::Internet.password }
>>>>>>> add destroy depndency
  end
end
