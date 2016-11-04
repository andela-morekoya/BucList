module Authenticable
  def authenticate_with_token
    render json: { error: 'Not authenticated' },
           status: :unauthorized unless current_user.present?
  end

  def current_user
    @current_user ||= User.find_by(id: (auth_token[:user][:id] if auth_token))
  rescue JWT::VerificationError, JWT::DecodeError
    render json: { error: 'Invalid Session' }, status: 403
  end

  def auth_token
    JsonWebToken.decode(http_header_token)
  end

  def http_header_token
    http_token = Token.find_by_token(request.headers['Authorization'])
    http_token.token if http_token && !http_token.expired?
  end
end
