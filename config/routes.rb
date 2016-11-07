require 'api_constraints'

Rails.application.routes.draw do
  get "/", to: redirect("/docs/index.html")

  namespace :api, defaults: { format: :json } do
    scope module: :v1,
          constraints: ApiConstraints.new(version: 1, default: true) do
      post "/auth/login"    => "auth#login"
      delete "/auth/logout"    => "auth#logout"
      resources :users, only: [:create]
      resources :bucketlists do
        resources :items
      end
    end
  end
end
