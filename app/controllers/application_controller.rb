class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  include Authenticable
  # helper_method :current_user
end
