module Api
  module V1
    class UsersController < ApplicationController
      def create
        @user = User.new(user_params)

        if @user.save
          render json: @user, status: :ok
        else
          render json: { error: 'User not created' },
                 status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.permit(:email, :password)
      end
    end
  end
end
