class JsonWebToken
  def self.encode(payload)
    # debugger
    JWT.encode(payload, ENV["TOKEN_SECRET_KEY"])
  end

  def self.decode(token)
    data = JWT.decode(token, ENV["TOKEN_SECRET_KEY"])[0]
    HashWithIndifferentAccess.new(data)
  rescue
    nil
  end

  private

  def secret_key
    ENV["TOKEN_SECRET_KEY"]
  end
end

