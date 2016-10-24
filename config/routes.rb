Rails.application.routes.draw do
  use_doorkeeper scope: "auth" do
    # it accepts :authorizations, :tokens, :applications and :authorized_applications
    # skip_controllers :applications, :authorized_applications
  end

  resources :users
  namespace :api, defaults: { format: :json } do
    scope module: :v1 do
      
    end
  end
end
