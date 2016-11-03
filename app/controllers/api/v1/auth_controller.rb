module Api
  module V1
    class AuthController < ApplicationController
      before_action :authenticate_with_token, only: [:logout]
      def login
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
          user.generate_token
          render json: user, status: 200
        else
          render json: {error: "Login failed"}, status: 403
        end
      end

      def logout
        Token.find_by_token(request.headers['Authorization']).destroy
        head 204
      end
    end
  end
end
