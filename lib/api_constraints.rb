class ApiConstraints
  def initialize(options)
    @version = options[:version]
    @default = options[:default]
  end

  def matches?(client_request)
    # debugger
    @default || client_request.headers['Accept']
      .include?("application/vnd.buclist.v#{@version}")
  end
end
