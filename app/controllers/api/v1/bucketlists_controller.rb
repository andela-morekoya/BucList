module Api
  module V1
    class BucketlistsController < ApplicationController
      before_action :set_bucketlist, only: [:show, :edit, :update, :destroy]

      def index
        render json: Bucketlist.all, status: 200
      end

      def show
        render json: @bucketlist, status: 200
      end

      def create
        @bucketlist = Bucketlist.new(bucketlist_params)

        if @bucketlist.save
          render json: @bucketlist, status: 201
        else
          render json: @bucketlist.errors, status: 400
        end
      end

      def update
        if @bucketlist.update(bucketlist_params)
          render json: @bucketlist, status: 200
        else
          render json: @bucketlist.errors, status: 400
        end
      end

      def destroy
        @bucketlist.destroy
        head 204
      end

      private

      def set_bucketlist
        @bucketlist = Bucketlist.find(params[:id])
      end

      def bucketlist_params
        params.require(:bucketlist).permit(:name)
      end
    end
  end
end
