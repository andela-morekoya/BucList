module Api
  module V1
    class BucketlistsController < ApplicationController
      before_action :set_bucketlist, only: [:show, :edit, :update, :destroy]
      before_action :authenticate_with_token

      def index
        render json: Bucketlist.all, status: :ok
      end

      def show
        render json: @bucketlist, status: :ok
      end

      def create
        @bucketlist = current_user.bucketlists.build(bucketlist_params)
        if @bucketlist.save
          render json: @bucketlist, status: :created
        else
          render json: @bucketlist, status: :bad_request
        end
      end

      def update
        if @bucketlist.user_id == current_user.id
          if @bucketlist.update(bucketlist_params)
            render json: @bucketlist, status: :ok
          else
            render json: @bucketlist, status: :bad_request
          end
        else
          render json: @bucketlist, status: :forbidden
        end
      end

      def destroy
        if @bucketlist.user_id == current_user.id
          @bucketlist.destroy
          head 204
        else
          render json: @bucketlist, status: :forbidden
        end
      end

      private

      def set_bucketlist
        @bucketlist = Bucketlist.find(params[:id])
      end

      def bucketlist_params
        params.require(:bucketlist).permit(:name, user: current_user)
      end
    end
  end
end
