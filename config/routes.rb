require 'api_constraints'

Rails.application.routes.draw do
  root "home#index"
  get "/login"     => "sessions#new"
  post "/login"    => "sessions#create"
  get "/logout"    => "sessions#destroy"
  get "/signup"    => "users#new"
  post "/users"    => "users#create"
  # resources :users

  use_doorkeeper scope: "auth" do
    # it accepts :authorizations, :tokens, :applications and :authorized_applications
    # skip_controllers :applications, :authorized_applications
  end

  namespace :api, defaults: { format: :json } do
    scope module: :v1, 
                  constraints: ApiConstraints.new(version: 1, default: true) do
      
    end
  end
end
