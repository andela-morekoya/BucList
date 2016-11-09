class ApplicationController < ActionController::API
  include Authenticable
  include Messages

  def no_route
    render json: { errors: no_route_found }, status: 404
  end
end
