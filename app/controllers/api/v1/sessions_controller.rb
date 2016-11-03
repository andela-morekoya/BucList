module Api
  module V1
    class AuthenticationController < ApplicationController
      before_action :set_user,

      def login
        @user
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

