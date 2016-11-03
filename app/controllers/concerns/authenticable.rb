module Authenticable
  def current_user
    # debugger
    @current_user ||= User.find_by(id: auth_token[:user][:id])
  # rescue JWT::VerificationError, JWT::DecodeError
  #   render json: { error: "Invalid Session" }, status: 403
  end

  def authenticate_with_token
    render json: { error: "Not authenticated" },
           status: :unauthorized unless current_user.present?
  end

  def auth_token
    JsonWebToken.decode(http_header_token)
  end

  def http_header_token
    request.headers['Authorization'] if 
      request.headers['Authorization'].present?
    # http_token = Token.find_by_token(request.headers['Authorization'])
    # if http_token && http_token.is_valid
    #   http_token
    # else
    #   return render json: { error: "Invalid Session" }, status: 403
    # end
  end

end
