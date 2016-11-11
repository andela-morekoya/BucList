module Api
  module V1
    class AuthController < ApplicationController
      include Messages
      before_action :authenticate_request, only: [:logout]

      def login
        user = User.find_by(email: params[:email])
        
        if user && user.authenticate(params[:password])
          user.generate_token
          render json: user, status: :ok
        else
          render json: { errors: failed_login }, status: :unauthorized
        end
      end

      def logout
        current_user.token.delete
        head 204
      end
    end
  end
end
