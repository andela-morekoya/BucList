require 'api_constraints'

Rails.application.routes.draw do
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
  get "/login"     => "sessions#new"
  post "/login"    => "sessions#create"
  get "/logout"    => "sessions#destroy"
  get "/signup"    => "users#new"
  post "/users"    => "users#create"
  # resources :users

>>>>>>> get model tests to pass
  use_doorkeeper scope: "auth" do
    # it accepts :authorizations, :tokens, :applications and :authorized_applications
    # skip_controllers :applications, :authorized_applications
  end

  namespace :api, defaults: { format: :json } do
    scope module: :v1 do
      
>>>>>>> setup doorkeeper
    end
  end
end
