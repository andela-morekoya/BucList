module Messages
  def failed_login
    'Login Failed'
  end

  def login
    'Please login to get your authentication token'
  end

  def not_created(data)
    "Error occured. #{data} was not created"
  end

  def not_updated(data)
    "Error occured. #{data} was not created"
  end

  def no_access
    'You do not have permission to access this resource'
  end

  def invalid_token
    'Your token is invalid'
  end
end
