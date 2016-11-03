module Api
  module V1
    class AuthController < ApplicationController
      before_action :set_user

      def login
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
          user.generate_token
          render json: user, status: 200
        else
          render json: "Login failed", status: 403
      end

      def logout
        set_user
        @user.token.destroy
      end

      protected

      def set_user
        @user = User.find_by(Token.find_by_token(PUT_SOMETHING).user_id)
      end
    end
  end
end

