module Messages
  extend ActiveSupport::Concern

  def login_success
    "Login was successful"
  end

  def login_error
    "Login failed"
  end
end
