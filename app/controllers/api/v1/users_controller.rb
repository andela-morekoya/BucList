module Api
  module V1
    class UsersController < ApplicationController
      include Messages
      def create
        @user = User.new(user_params)

        if @user.save
          render json: { user: @user, next_step: login }, status: :ok
        else
          render json: { error: not_created('User') },
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
