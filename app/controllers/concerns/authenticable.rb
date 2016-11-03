module Authenticable
  def current_user
    @current_user ||= User.find_by(auth_token[:user][:user_id])
  end

  def authenticate_with_token
    return render json: { error: "Invalid Session" }, status: 403 unless 
          current_user.present? && @current_user.token.is_valid
    return render json: { error: "Not authenticated" },
           status: :unauthorized unless current_user.present?
  end

  def auth_token
    JsonWebToken.decode(http_header_token)
  end

  def http_header_token
    request.headers['Authorization'] if 
      request.headers['Authorization'].present?
  end

end
