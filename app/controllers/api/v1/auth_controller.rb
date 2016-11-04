module Api
  module V1
    class AuthController < ApplicationController
      before_action :authenticate_with_token, only: [:logout]

      def login
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
          user.generate_token
          render json: user, status: :ok
        else
          render json: { error: 'Login failed' }, status: :unauthorized
        end
      end

      def logout
        current_user.token.delete
        head 204
      end
    end
  end
end
