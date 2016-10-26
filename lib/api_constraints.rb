class ApiConstraints
  def initialize(options)
    @version = options[:version]
    @default = options[:default]
  end

  def matches?(client_request)
<<<<<<< HEAD
    @default || client_request.headers['Accept']
      .include?('application/vnd.secchio.v%{@version}')
=======
    @default || client_request.headers["Accept"].include?("application/vnd.secchio.v%{@version}")
>>>>>>> implement versioning
  end
end
