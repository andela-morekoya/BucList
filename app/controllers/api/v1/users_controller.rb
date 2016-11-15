module Api
  module V1
    class UsersController < ApplicationController
      include Messages
      def create
        user = User.new(user_params)

        if user.save
          user.generate_token
          render json: user, status: :created
        else
          render json: { errors: no_change(user) },
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
