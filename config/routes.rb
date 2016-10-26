Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :bucketlists do
        resources :items
      end
    end
  end
end
