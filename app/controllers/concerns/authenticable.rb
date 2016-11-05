module Authenticable
  include Messages
  def authenticate_request
    render json: { error: invalid_token },
           status: :unauthorized unless current_user.present?
  end

  def current_user
    @current_user ||= User.find_by(id: (auth_token[:user][:id] if auth_token))
  end

  def auth_token
    JsonWebToken.decode(http_header_token)
  end

  def http_header_token
    http_token = Token.find_by_token(request.headers['Authorization'])
    http_token.token if http_token && !http_token.expired?
  end
end
