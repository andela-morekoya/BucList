require 'api_constraints'

Rails.application.routes.draw do
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  namespace :api, defaults: { format: :json } do
    scope module: :v1,
          constraints: ApiConstraints.new(version: 1, default: true) do
      resources :users
      resources :bucketlists do
        resources :items
      end
=======
=======
=======
  root "home#index"
>>>>>>> implement versioning
  get "/login"     => "sessions#new"
  post "/login"    => "sessions#create"
  get "/logout"    => "sessions#destroy"
  # get "/signup"    => "users#new"
  # post "/users"    => "users#create"
  # resources :users

<<<<<<< HEAD
>>>>>>> get model tests to pass
  use_doorkeeper scope: "auth" do
    # it accepts :authorizations, :tokens, :applications and :authorized_applications
    # skip_controllers :applications, :authorized_applications
  end

=======
>>>>>>> write test for BucketlistsController #show #index
  namespace :api, defaults: { format: :json } do
<<<<<<< HEAD
    scope module: :v1, 
                  constraints: ApiConstraints.new(version: 1, default: true) do
<<<<<<< HEAD
      
>>>>>>> setup doorkeeper
=======
=======
    scope module: :v1,
          constraints: ApiConstraints.new(version: 1, default: true) do
>>>>>>> fix rubocop issues
      resources :users
<<<<<<< HEAD
>>>>>>> change user controller
=======
      resources :bucketlists do
        resources :items
      end
>>>>>>> write test for BucketlistsController #show #index
    end
  end
end
