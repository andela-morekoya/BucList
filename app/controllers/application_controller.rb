class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  include Authenticable

  def respond_with_errors(object)
    render json: { errors: ErrorSerializer.serialize(object) },
           status: :unprocessable_entity
  end
end
