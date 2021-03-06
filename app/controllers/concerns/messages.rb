module Messages
  def failed_login
    'Login Failed'
  end

  def no_change(data)
    data.errors.messages.each { |key, value| "#{key} #{value}" }
  end

  def no_access
    'You do not have permission to access this resource'
  end

  def invalid_token
    'Your token is invalid'
  end

  def no_route_found
    'That endpoint does not exist'
  end
end
